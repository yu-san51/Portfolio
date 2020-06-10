class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|

      t.integer :contractor, null: false, foreign_key: true
      t.integer :contractee, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true
      t.integer :is_status, null: false, default: 0
      t.integer :contract_price, null: false
      t.timestamps
    end
  end
end
