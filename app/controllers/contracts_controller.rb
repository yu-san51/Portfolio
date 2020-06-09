class ContractsController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:confirm, :update, :cancel, :show, :deal]

  def index
    @contractor_contracts = Contract.where(contractor_id: current_user.id).where(contractor_status: 'spplying', contractor_status: 'fulfillment')
    @contractee_contracts = Contract.where(contractee_id: current_user.id).where(contractee_status: 'fulfillment')
  end

  def confirm
    @contract = Contract.find(params[:id])
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
    item.contracted!
    flash[:notice] = '契約申請しました。案件制作者様のご連絡をお待ちください。'
    redirect_to user_path(current_user.id)
  end

  def update
    contract = Contract.find(params[:id])
    #契約者が契約終了押したら
    if contract.contractor_id == current_user.id
      case contract.contractor_status
      when 'fulfillment'
        contract.update(contractor_status: 'contract_finish')
        if contract.contractee_status == 'contract_finish' && contract.contractor_status == 'contract_finish'
          contract.update(contractor_status: 'contract_end', contractee_status: 'contract_end')
          flash[:notice] = '契約がすべて終了いたしました。またのご利用お待ちしております。'
        else
          flash[:notice] = '両者の契約終了を持ちまして契約満了となりますので、お待ちください。'
        end
        redirect_to items_path
      when 'contract_finish'
        flash[:notice] = 'すでに終了されています。相手のリアクションをお待ちください。'
        redirect_to items_path
      end

    else  #請負側が終了を押した時
      case contract.contractee_status
      when 'standing'
        contract.update(contractor_status: 'fulfillment', contractee_status: 'fulfillment')
        redirect_to deal_contract_path(contract.id)
      when 'fulfillment'
        contract.update(contractee_status: 'contract_finish')
        if contract.contractee_status == 'contract_finish' && contract.contractor_status == 'contract_finish'
           contract.update(contractor_status: 'contract_end', contractee_status: 'contract_end')
           flash[:notice] = '契約がすべて終了いたしました。またのご利用お待ちしております。'
        else
          flash[:notice] = '両者の契約終了を持ちまして契約満了となりますので、お待ちください。'
        end
        redirect_to items_path
      when 'contract_finish'
        flash[:notice] = 'すでに終了されています。相手のリアクションをお待ちください。'
        redirect_to items_path
      end
    end
  end

  def cancel
    contract = Contract.find(params[:id])
    contract.update(contractee_status: 'contract_cancel', contractor_status: 'contract_cancel')
    contract.item.open!
    flash[:notice] = "契約をキャンセルしました。"
    redirect_to item_path(contract.item_id)
  end

  def show
    @contract = Contract.find(params[:id])

  end

  def deal
    @contract = Contract.find(params[:id])
  end

  def correct_user
    contract = Contract.find(params[:id])
    if current_user.id != contract.contractor_id && current_user.id != contract.contractee_id
      flash[:notice] = '契約者のみ閲覧、変更できます。'
      redirect_to items_path
    end
  end



  private
   def contract_params
     params.require(:contract).permit(:item_id, :contract_price, :contractee_id)
   end

   def status_params
     params.require(:contract).permit(:contractor_status, :contractee_status)
   end
end
