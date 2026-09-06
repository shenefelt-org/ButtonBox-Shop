class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :tax_rate
end
