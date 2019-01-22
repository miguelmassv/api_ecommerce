# == Schema Information
#
# Table name: payments
#
#  id             :bigint(8)        not null, primary key
#  payment_method :string
#  order_id       :bigint(8)
#  user_id        :bigint(8)
#  total_ammount  :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
