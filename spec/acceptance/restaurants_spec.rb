require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Restaurants' do
  get '/v1/restaurants' do
    let(:user) { User.create(email: Faker::Internet.email, password: "123456", password_confirmation: "123456", shipping_address: Faker::Address.full_address) }

    before do
      category_1 = Category.create(name: "Seafood")
      category_2 = Category.create(name: "Salad")
      category_3 = Category.create(name: "Drinks")
      restaurant_1 = Restaurant.create(name: 'test restaurant 1', nit: 123456)
      restaurant_2 = Restaurant.create(name: 'test restaurant 2', nit: 654321)
      restaurant_1.categories << [category_1, category_2]
      restaurant_2.categories << [category_2, category_3]
    end

    example 'List all restaurants' do
      explanation "List restaurants, categories and products"

        header "Content-Type", "application/json"
        header "X-User-Email", user.email
        header "X-User-Token", user.authentication_token


        # sign_in user
        do_request

        expect(status).to eq(200)
        expect(response_body).to eq({"restaurants": [
            {"name": "test restaurant 1", "nit": 123456},
            {"name": "test restaurant 2", "nit": 654321}
          ]}.to_json)
       end
   end
 end
