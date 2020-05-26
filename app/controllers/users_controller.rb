class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@items = @user.items.all
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

	private
	def user_params
		params.require(params[:type]).permit(:image_id, :name, :email, :introduction)
	end

end
