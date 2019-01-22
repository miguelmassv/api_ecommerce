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
  has_and_belongs_to_many :categories
  has_many :products
end
