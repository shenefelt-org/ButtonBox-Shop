class Order < ApplicationRecord
  belongs_to :user
  has_one :tax_rate
end
