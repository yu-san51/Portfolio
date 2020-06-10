class RenameUesrIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :uesr_id, :user_id
  end
end
