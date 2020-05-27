class FavoritesController < ApplicationController

  def create
  	@item = Item.find(params[:item_id])
  	favorite = current_user.favorites.new(item_id: @item.id)
  	favorite.save
  end

  def destroy
  	favorite = Favorite.find(params[:id]) #current_user.favorites.find_by(item_id: @item.id)
  	@item = favorite.item
  	favorite.destroy
  end
end
