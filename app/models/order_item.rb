# == Schema Information
#
# Table name: order_items
#
#  id          :bigint(8)        not null, primary key
#  product_id  :bigint(8)
#  order_id    :bigint(8)
#  unit_price  :decimal(, )
#  total_price :decimal(, )
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_unit_price
  before_save :set_total_price

  delegate :name, to: :product, prefix: true
  delegate :description, to: :product, prefix: true

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total_price
    self[:total_price] = quantity * set_unit_price
  end

end
