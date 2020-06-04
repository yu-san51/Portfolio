class ContractsController < ApplicationController

  def confirm
    @contract = Contract.find(item_id: params[:item_id])
    @item = @contract.item
  end

  def new
    @item = Item.find(params[:item_id])
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.contractor_id = current_user.id
    @contract.save
    item = Item.find(params[:contract][:item_id])
    redirect_to deal_item_contracts_path
  end

  def update
    contract = Contract.find(params[:id])
    contract.update(contract_params)
    redirect_to deal_item_contracts_path
  end

  def destroy
    contract = Contract.find(params[:id])
    contract.destroy
    redirect_to item_path(contract.item.id)
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def deal
    
  end


  private
   def contract_params
     params.require(:contract).permit(:item_id, :contract_price, :contractee_id, :is_contractor_status, :is_contractee_status)
   end
end
