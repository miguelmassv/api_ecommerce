# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  user_id          :bigint(8)
#  payment_method   :integer
#  shipping_address :string
#  phone_number     :string
#  restaurant_id    :bigint(8)
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_item
end
