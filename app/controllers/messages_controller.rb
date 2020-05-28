class MessagesController < ApplicationController

	def show
		@message = Message.new
		@room = Room.find(params[:id])
		@messages = Message.all
	end
	
	def create
		@message = Message.new(message_params)
		@message.receiver = User.find(params[:receiver])
		@message.sender = current_user.id
		@message.room_id = @room.id
		@message.save
	end

	private
	def message_params
		params.require(:message).permit(:content, :sender, :reciever, :room_id)
	end
end
