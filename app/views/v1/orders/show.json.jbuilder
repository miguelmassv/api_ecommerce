order_items = @order.order_items
json.orders do
  json.user_id @order.user_id
  json.total @order.total
  json.total_items order_items.map(&:quantity).sum
  json.products do
    json.array! order_items do |order_item|
      json.id order_item.product_id
      json.name order_item.product_name
      json.description order_item.product_description
      json.price order_item.product.price
      json.quantity order_item.quantity
    end
  end
end
