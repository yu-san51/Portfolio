class ContractsController < ApplicationController

  def confirm
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
    @contract = Contract.new
  end

  def create
    user = Item.find(params[:item_id]).user_id
    contractor = current_user.contract!(user)
    contractor.save
    @contract = Contract.new(contract_params)
    @contract.save
    redirect_to deal_contracts_path
  end

  def edit
    
  end

  def update
  end

  def show
    @cocntract = Contract.find(params[:id])
  end

  def deal
    
  end


  private
  def contract!(item_user)
    contractor_relationships.create!(contractor: item_user.id)
  end

  def uncontract!(item_user)
    contractor_relationships.find_by(contractor: item_user.id).destroy
  end

  def contract_params
    params.require(:contract).permit(:item_id, :contract_price)
  end
end
