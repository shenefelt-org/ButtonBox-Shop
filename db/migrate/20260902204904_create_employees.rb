class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.text :name
      t.integer :emp_id

      t.timestamps
    end
  end
end
