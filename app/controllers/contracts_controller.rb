class ContractsController < ApplicationController
    before_action :authenticate_user!
    
  def confirm
    @item = Item.find(params[:item_id])
    @contract = Contract.new
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

  def edit
    
  end

  def update
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
end
