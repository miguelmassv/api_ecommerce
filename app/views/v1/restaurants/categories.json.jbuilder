json.categories do
  json.array! @categories do |category|
    json.category category.name
    json.products do
      products = category.products.select{ |category| category.restaurant_id ==  @restaurant.id }
      json.array! products  do |product|
        json.name product.name
        json.description product.description
        json.price product.price
      end
    end
  end
end
