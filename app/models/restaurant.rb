# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  nit        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  has_many :category
  has_many :product
end
