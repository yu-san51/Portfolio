class ItemsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    #if current_user == teacher
      #@items = Item.user.where(user_type: "teacher").to_a
    #else
     # users = User.where(user_type: "student")
      #@items = users.items.all
    #end
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.user_id = current_user.id
    if item.save
      redirect_to item_path(item.id)
    else
      @item = item
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      @item = item
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def correct_user
    item = Item.find(params[:id])
    if current_user != item.user
      redirect_to items_path
    end
  end


  private
  def item_params
    params.require(:item).permit(:user_id, :prefer_sex, :duration, :price, :is_active, :is_continue, :title, :body, style_ids: [])
  end

end
