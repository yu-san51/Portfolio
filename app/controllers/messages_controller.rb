class MessagesController < ApplicationController

	def show
		@message = Message.new
		@room = Room.find(params[:id])
		@messages = @room.contents
	end
	
	def create
		@message = Message.new(message_params)
		@message.room_id = Room.find(params[:id])
		@message.sender_id = currernt_user.id
		@message.receiver_id = Item.find(@message.room_id).user_id
		@message.save
	end

	private
	def message_params
		params.require(:message).permit(:content, :sender_id, :reciever_id, :room_id)
	end
end
