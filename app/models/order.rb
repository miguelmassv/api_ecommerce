# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  user_id          :bigint(8)
#  total            :decimal(, )
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
  has_many :order_items, dependent: :destroy
  before_save :set_total
  has_one :payment, dependent: :destroy 

  enum status: { in_process: 0, completed: 1, canceled: 2, rejected: 3 }

  scope :by_user_id, -> (user_id) { where(user_id: user_id) }
  scope :by_status, -> (status) { where(status: status) }

  def total
    order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
  end

  private

  def set_total
    self[:total] = total
  end

end
