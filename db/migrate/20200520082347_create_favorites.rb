class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :uesr_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
