class CreateCans < ActiveRecord::Migration[6.0]
  def change
    create_table :cans do |t|
      t.integer :active_id,    null: false
      t.integer :place_id,     null: false
      t.integer :set_time_id,  null: false
      t.text :description,     null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
