json.restaurants do
  json.array! @restaurants do |restaurant|
    json.name restaurant.name
    json.nit restaurant.nit
  end
end
