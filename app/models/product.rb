# == Schema Information
#
# Table name: products
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  description      :text
#  price            :decimal(, )
#  reference_number :string
#  category_id      :bigint(8)
#  restaurant_id    :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
end
