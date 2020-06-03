class FavoritesController < ApplicationController

  def create
  	@item = Item.find(params[:item_id])
  	favorite = current_user.favorites.new(item_id: @item.id)
  	favorite.save
  end

  def destroy
  	favorite = Favorite.find(params[:id])
  	@item = favorite.item
  	favorite.destroy
  end

end
