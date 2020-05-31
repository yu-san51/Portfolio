class MessagesController < ApplicationController

	def show
		@message = Message.new
		@room = Room.find(params[:id])
		@messages = @room.messages.all
	end

	def create
		@message = Message.new(message_params)
		@message.sender_id = current_user.id
		@message.save!
	end

	private
	def message_params
		params.require(:message).permit(:content, :receiver_id, :room_id)
	end
end
