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

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
