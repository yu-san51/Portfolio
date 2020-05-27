class RoomsController < ApplicationController

  def create
    room = Room.find(params[:id])
    if room.present?
      render message_path(room.id)
    else
      room = Room.new(room_params)
      room.save
      render message_path(room.id)
    end
  end

end
