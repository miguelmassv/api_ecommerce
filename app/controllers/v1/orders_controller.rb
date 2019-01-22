class V1::OrdersController < ApplicationController
  before_action :fetch_order, only: :complete
  before_action :authenticate_user!

  def show
    @order = Order.includes(order_items: :product).by_user_id(current_user.id).by_status( 0).try(:take)
    if @order.blank?
      render json: {message: "There is no order in process for user: #{current_user.email}"}, status: :unprocessable_entity
    end

  end

  def complete
    @order.shipping_address = params[:order][:shipping_address].present? ? params[:order][:shipping_address]: current_user.shipping_address
    @order.phone_number = (params[:order][:phone_number])
    @order.status = 1
    payment = Payment.new(payment_method: params[:order][:payment_method], order: @order, user: @order.user, total_ammount: @order.total)
    if @order.save! && payment.save!
      render json: {message: "Order has been payed and marked as completed"}, status: :ok
    else
      render json: { errors: "The order has not been completed successfully." }, status: :unprocessable_entity
    end
  end

  def user_orders
    @user_orders = Order.where(user_id: params[:user_id])
    # render json: @user_orders
  end
  private

  def order_params
    params.require(:order).permit(:shipping_address, :phone_number)
  end

  def fetch_order
    @order = current_order
    unless @order.persisted?
      render json: {message: "There is no order in process for user: #{@order.user.email}"}, status: :unprocessable_entity
    end
  end
end
