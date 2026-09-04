class CreateTaxRates < ActiveRecord::Migration[8.1]
  def change
    create_table :tax_rates do |t|
      t.text :state
      t.text :abbreviation
      t.decimal :rate

      t.timestamps
    end
  end
end
