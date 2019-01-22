module ApplicationHelper
  def current_order(restaurant_id = nil)
    order_in_process = Order.by_user_id(current_user.id).by_status(0).last
    order_in_process.present? ? order_in_process : Order.new(status: 0, restaurant_id: restaurant_id, user: current_user)
  end
end
