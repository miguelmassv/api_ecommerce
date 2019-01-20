class V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def categories
    @restaurant = Restaurant.includes(categories: :products).find_by(id: params["restaurant_id"])
    @categories = @restaurant.categories
  end
end
