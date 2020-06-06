class ContractsController < ApplicationController
    before_action :authenticate_user!
    # before_action :correct_user, only: [:confirm, :update, :cancel, :show, :deal]

  def index
      @contracts = current_user.contracts.where.not(contractee_status: '契約キャンセル')
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
    item.契約済み!
    flash[:notice] = '契約申請しました。案件制作者様のご連絡をお待ちください。'
    redirect_to user_path(current_user.id)
  end

  def update
    contract = Contract.find(params[:id])
    #契約者が契約終了押したら
    if current_user.id == contract.contractor.id
      contract.update(contractor_status: '契約終了')
      if contract.contractee_status == '契約終了' && contract.contractor_status == '契約終了'
        contract.update(contractor_status: '契約満了', contractee_status: '契約満了')
        flash[:notice] = '契約がすべて終了いたしました。またのご利用お待ちしております。'
      else
        flash[:notice] = '両者の契約終了を持ちまして契約満了となりますので、お待ちください。'
      end
    else  #請負側が終了を押した時
      case contract.contractee_status
      when '受付中'
        contract.update(contractor_status: '履行中', contractee_status: '履行中')
        redirect_to deal_contract_path(@contract.id)
      when '履行中'
        contract.update(contractee_status: '契約終了')
        if contract.contractee_status == '契約終了' && contract.contractor_status == '契約終了'
           contract.update(contractor_status: '契約満了', contractee_status: '契約満了')
           flash[:notice] = '契約がすべて終了いたしました。またのご利用お待ちしております。'
        else
          flash[:notice] = '両者の契約終了を持ちまして契約満了となりますので、お待ちください。'
        end
      end
    end
    redirect_to items_path
  end

  def cancel
    contract = Contract.find(params[:id])
    contract.update(contractee_status: '契約キャンセル', contractor_status: '契約キャンセル')
    contract.item.受付中!
    flash[:notice] = "#{contract.contractor}さんからの契約はキャンセルしました。"
    redirect_to item_path(contract.item_id)
  end

  def show
    @contract = Contract.find(params[:id])

  end

  def deal
    
  end

  # def correct_user
  #   contract = Contract.find(params[:id])
  #   if current_user.id != contract.contractor_id || current_user.id != contract.contractee_id
  #     flash[:notice] = '契約者のみ閲覧、変更できます。'
  #     redirect_to items_path
  #   end
  # end



  private
   def contract_params
     params.require(:contract).permit(:item_id, :contract_price, :contractee_id)
   end

   def status_params
     params.require(:contract).permit(:contractor_status, :contractee_status)
   end
end
