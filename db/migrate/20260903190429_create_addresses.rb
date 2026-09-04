class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :street_address
      t.text :city
      t.text :state
      t.integer :zip

      t.timestamps
    end
  end
end
