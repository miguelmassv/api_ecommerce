# == Schema Information
#
# Table name: order_items
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  order_id   :bigint(8)
#  unit_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
