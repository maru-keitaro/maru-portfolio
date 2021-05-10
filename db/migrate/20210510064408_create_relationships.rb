class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :target_user, null: false, foreign_key: false
      t.timestamps
    end
  end
end
