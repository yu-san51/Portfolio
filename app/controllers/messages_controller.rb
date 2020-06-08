class MessagesController < ApplicationController
	before_action :authenticate_user!
	
	def show
		if Item.find(params[:id]).open?
	    	unless @room = Room.find_by(item_id: params[:id])
	      		@room = Room.new(item_id: params[:id])
	      		@room.save
	    	end
			@message = Message.new
			@messages = @room.messages.all
		else
			@item = Item.find(params[:id])
			flash[:notice] = '受付中の案件のみ、コメントルームを使用できます。'
			redirect_to items_path
		end
	end

	def create
		@message = Message.new(message_params)
		@message.sender_id = current_user.id
		@message.save!
	end

	private
	def message_params
		params.require(:message).permit(:content, :room_id)
	end
end
