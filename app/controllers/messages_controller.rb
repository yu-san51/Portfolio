class MessagesController < ApplicationController

	def show
		@message = Message.new
		@room = Room.find(params[:id])
		@messages = @room.messages.all

			# if @room.item.user_id == current_user.id
			# 	@receiver = @room.item.user_id
			# else
			# 	@receiver = current_user.id
			# end
		#end
		# messages is nil, message receiver ni @room.item.user_id wo ireru
		# messages is not nil, @room.item.user_id == current_user.id
	end

	def create
		@message = Message.new(message_params)
		@message.sender = current_user.id
		@message.save
	end

	private
	def message_params
		params.require(:message).permit(:content, :receiver, :room_id)
	end
end
