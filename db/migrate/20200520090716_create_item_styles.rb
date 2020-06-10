class CreateItemStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :item_styles do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :style_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
