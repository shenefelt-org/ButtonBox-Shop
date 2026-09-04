class AddCustomerForeginKeyToQuotes < ActiveRecord::Migration[8.1]
  def change
    add_reference :quotes, :customer, null: false, foreign_key: true
  end
end
