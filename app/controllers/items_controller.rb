class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    unless user_signed_in?
      @items = Item.page(params[:page]).reverse_order
    else
      if current_user.user_type == 'teacher'
        @items = Item.joins(:user).where(users: {user_type: 'student'}).page(params[:page]).reverse_order
      else
        @items = Item.joins(:user).where(users: {user_type: 'teacher'}).page(params[:page]).reverse_order
      end
    end
  end

  def show
    @item = Item.find(params[:id])
    @review_count = Contract.contract_reviews(@item.user.id).count
    @review_average = Contract.contract_average_rate(@item.user.id)
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

  def favorites  #uesr気になる案件一覧ページ
    @items = current_user.item_favorites.includes(:user).page(params[:page]).reverse_order
  end

  def correct_user
    item = Item.find(params[:id])
    if current_user != item.user
      redirect_to items_path
    end
  end


  private
  def item_params
    params.require(:item).permit(:user_id, :prefer_sex, :duration, :price, :active_status, :is_continue, :title, :body, style_ids: [])
  end

end
