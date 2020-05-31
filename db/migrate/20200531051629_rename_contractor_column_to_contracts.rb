class RenameContractorColumnToContracts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :contracts, :contractor, :contractor_id
  	rename_column :contracts, :contractee, :contractee_id
  end
end
