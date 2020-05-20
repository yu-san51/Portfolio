class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :sender, null: false, foreign_key: true
      t.integer :receiver, null: false, foreign_key: true
      t.integer :room_id, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
