# frozen_string_literal: true

class CreateSupabaseUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :users, force: :cascade
    create_table :users, id: :uuid do |t|
      t.string :email

      t.timestamps
    end
  end
end
