class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@items = @user.items.all
	end

	def edit
		
	end

	def update
		
	end

	def bye_bye
		
	end

end
