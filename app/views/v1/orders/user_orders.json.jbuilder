# order_items = @order.order_items
json.orders do
  json.array! @user_orders do |user_order|

    json.order_id user_order.id
    json.user_id user_order.user_id
    json.total user_order.total
    # debugger
    json.total_items user_order.order_items.map(&:quantity).sum
    json.status user_order.status
  end
end
