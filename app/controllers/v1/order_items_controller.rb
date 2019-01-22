class V1::OrderItemsController < ApplicationController
  before_action :fetch_product, only: :create
  before_action :authenticate_user!

  def create
    @order = current_order(@product.restaurant_id)
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    render json:{ message: "Product has been added" }, status: :created
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by(product_id: order_item_params[:product_id])
    @order_item&.destroy
    render json:{ message: "Product has been deleted" }, status: :ok
  end

  private

    def fetch_product
      @product = Product.find_by(id: order_item_params[:product_id])
      render json: {message: "product not found"} unless @product
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity)
    end
end
