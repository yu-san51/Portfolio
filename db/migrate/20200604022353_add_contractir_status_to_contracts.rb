class AddContractirStatusToContracts < ActiveRecord::Migration[5.2]
  def change
  	add_column :contracts, :contractee_status, :integer, default: 0
  	rename_column :contracts, :is_status, :contractor_status
  end
end
