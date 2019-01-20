user = User.create(email: Faker::Internet.email, password: "123456", password_confirmation: "123456", shipping_address: Faker::Address.full_address)

Category.create(name: "Seafood")
Category.create(name: "Salad")
Category.create(name: "Drinks")
Category.create(name: "Vegetarian")
Category.create(name: "Snacks")

10.times do
  restaurant = Restaurant.create(name: Faker::Company.name, nit: Faker::Number.number(6))
  restaurant.categories = Category.order("RANDOM()").limit(3)
end

Restaurant.all.each do |restaurant|
  restaurant.categories.each do |category|
    3.times do
      Product.create(name: Faker::Food.dish, description: Faker::Food.description, price: Faker::Commerce.price, reference_number: Faker::Number.number(10), category: category, restaurant: restaurant)
    end
  end
end
