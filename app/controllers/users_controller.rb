class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:show, :items]

	def show
		@user = User.find(params[:id])
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
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	def items
		@user = User.find(params[:id])
		@items = @user.items.where.not(active_status: 'contracted').page(params[:page]).reverse_order
	end

	def notice
		@contractor_contracts = Contract.where(contractor_id: current_user.id).page(params[:page]).reverse_order
		@contractee_contracts = Contract.where(contractee_id: current_user.id).page(params[:page]).reverse_order
	end

	private
	def user_params
		params.require(:user).permit(:image, :name, :email, :introduction)
	end

end
