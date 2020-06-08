class ChangeDataIsActiveToItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :items, :is_active, :active_status
  	change_column :items, :active_status, :integer, default: 0
  	change_column :users, :sex, :integer, default: 0
  end
end
