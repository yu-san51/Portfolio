class RenameTypeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :type, :user_type
  	change_column :users, :user_type, :integer
  end
end
