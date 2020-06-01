class MessagesController < ApplicationController

	def show
    	unless @room = Room.find_by(item_id: params[:id])
      		@room = Room.new(item_id: params[:id])
      		@room.save
    	end
		@message = Message.new
		@messages = @room.messages.all
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
