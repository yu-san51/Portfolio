class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:show, :items]

	def show
		@user = User.find(params[:id])
		@review_count = Contract.contract_reviews(@user.id).count
		@review_average = Contract.contract_average_rate(@user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
			redirect_to user_path(user.id)
		else
			@user = user
			render :edit
		end
	end

	def destroy   #paranoia destroy
		#if　current_user.contractor_relationships.contractor_in_progress || current_user.contractee_relationships.contractee_in_progress
		if Contract.where(contractor_id: current_user.id).where.not(contractor_status: 'contract_end', contractor_status: 'contract_cancel') || Contract.where(contractee_id: current_user.id).where.not(contractee_status: 'contract_cancel', contractee_status: 'contract_finish')
			flash[:notice] = '契約進行中にある時は退会できません。契約内容を満了させてから退会してください。'
			redirect_to user_path(current_user.id)
		else
			@user = User.find(params[:id])
		#案件を持っていた時は受付停止に
			@user.items.each do |item|
				item.close!
			end
			@user.destroy
			redirect_to root_path
		end
	end

	def items
		@user = User.find(params[:id])
		@items = @user.items.where.not(active_status: 'contracted').page(params[:page]).reverse_order
	end

	def notice
		#コントラクターのメッセージ
		@messages = []
		@contractor_contracts = Contract.where(contractor_id: current_user.id)
		@contractor_contracts.each do |contractor_contract|
			case contractor_contract.contractee_status
			when 'standing'
				message = '申請中です。リアクションされるまでしばらくお待ちください。'
			when 'fulfillment'
				message = '申請は承認されました。契約が終了したときは、詳細ページから終了ボタンを押してください。'
			when 'contract_finish'
				message = '契約は相手によって終了されました。契約内容が終了している場合は詳細ページから終了ください。'
			when 'contract_end'
				message = '契約は満了となりました。'
			when 'contract_cancel'
				message = '契約はキャンセルされました。他の案件に応募するか、ご自身で提案してください。'
			end
			@messages.push(message)
		end
		#コントラクティーへのメッセージ
		@contractee_messages = []
		@contractee_contracts = Contract.where(contractee_id: current_user.id)
		@contractee_contracts.each do |contractee_contract|
			case contractee_contract.contractor_status
			when 'spplying'
				contractee_message = '申請が届いております。リアクションしましょう。'
			when 'fulfillment'
				contractee_message = '契約が終了したときは、詳細ページから終了ボタンを押してください。'
			when 'contract_finish'
				contractee_message = '契約は終了されました。詳細ページから終了ボタンを押してください。'
			when 'contract_end'
				contractee_message = '契約は満了となりました。'
			when 'contract_cancel'
				contractee_message = '契約をキャンセルしました。'
			end
			@contractee_messages.push(contractee_message)
		end
	end

	def reviews
		@user = User.find(params[:id])
		@reviews = Contract.contract_reviews(@user.id)
	end


	private
	def user_params
		params.require(:user).permit(:image, :name, :email, :introduction)
	end

end
