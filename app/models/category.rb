# == Schema Information
#
# Table name: categories
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  restaurant_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Category < ApplicationRecord
  belongs_to :restaurant
  has_many :product
end
