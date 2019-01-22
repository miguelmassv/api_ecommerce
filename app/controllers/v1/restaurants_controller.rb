class V1::RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.all
  end

  def categories
    @restaurant = Restaurant.includes(categories: :products).find_by(id: params["restaurant_id"])
    @categories = @restaurant.categories
  end
end
