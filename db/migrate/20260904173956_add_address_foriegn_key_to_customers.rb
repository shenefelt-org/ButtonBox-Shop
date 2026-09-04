class AddAddressForiegnKeyToCustomers < ActiveRecord::Migration[8.1]
  def change
    add_reference :customers, :address, null: true, foreign_key: true
  end
end
