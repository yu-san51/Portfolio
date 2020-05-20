class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
