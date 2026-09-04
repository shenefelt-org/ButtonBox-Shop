class AddTaxRateToOrders < ActiveRecord::Migration[8.1]
  def change
    add_reference :orders, :tax_rate, null: false, foreign_key: true
  end
end
