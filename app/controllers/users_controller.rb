class UsersController < ApplicationController

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
		@items = @user.items
	end

	private
	def user_params
		params.require(:user).permit(:image, :name, :email, :introduction)
	end

end
