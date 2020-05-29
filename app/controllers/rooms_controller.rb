class RoomsController < ApplicationController

  def create

    if Room.find_by(item_id: params[:id])
      room = Message.find_by(room_id: Room.find(params[:item_id]), sender: current_user.id)
      redirect_to message_path(room.id)
    else
      room = Room.new(item_id: params[:item_id])
      room.save
      # message = Message.new(
      #   room_id: room.id,
      #   sender: room.item.user.id,
      #   receiver: current_user.id,
      #   content: "ご質問などありましたら、こちらでご相談ください。"
      # )
      # message.save

      redirect_to message_path(room.id)
    end
  end

end
