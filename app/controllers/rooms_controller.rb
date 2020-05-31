class RoomsController < ApplicationController

  def create

    if Room.find_by(item_id: params[:id])
      room = Message.find_by(room_id: Room.find(params[:item_id]), sender_id: current_user.id)
      redirect_to message_path(room.id)
    else
      room = Room.new(item_id: params[:item_id])
      room.save
      redirect_to message_path(room.id)
    end
  end

end
