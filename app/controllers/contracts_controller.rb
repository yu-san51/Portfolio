class ContractsController < ApplicationController
    before_action :authenticate_user!
    
  def confirm
    @contract = Contract.find_by(item_id: params[:item_id])
    @item = @contract.id
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
    item.destroy
    redirect_to deal_item_contracts_path
  end

  def update
    @contract = Contract.find(params[:id])
    @contract.update(contractor_status: '進行中')
    redirect_to user_path(current_user.id)
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
     params.require(:contract).permit(:item_id, :contract_price, :contractee_id)
   end

   def status_params
     params.require(:contract).permit(:contractor_status, :contractee_status)
   end
end
