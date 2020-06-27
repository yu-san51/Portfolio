class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

    	t.float :rate, null: false
    	t.text :comment
    	t.integer :contract_id, null: false
    	t.integer :user_id, null: false

      t.timestamps
    end
  end
end
