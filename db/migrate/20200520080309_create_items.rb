class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :user_id, null: false, foreign_key: true
      t.integer :prefer_sex, null: false, default: 0
      t.integer :price, null: false
      t.string :duration, null: false
      t.string :title, null: false
      t.text :body, null:false
      t.boolean :is_active, null: false, default: true
      t.boolean :is_continue, null: false, default: true
      t.timestamps
    end
  end
end
