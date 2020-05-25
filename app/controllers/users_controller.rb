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
		if user.update(user_parmas)
			redirect_to user_path(user.id)
		else
			@user = user
			render :edit
		end
	end

	def bye_bye
		
	end

end
