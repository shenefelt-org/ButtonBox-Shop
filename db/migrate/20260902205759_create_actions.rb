class CreateActions < ActiveRecord::Migration[8.1]
  def change
    create_table :actions do |t|
      t.references :employee, null: false, foreign_key: true
      t.text :type

      t.timestamps
    end
  end
end
