class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]


  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.save
      redirect_to @item.user, notice: 'Items succesfully added'
    end
  end

  def show
    @item = Item.friendly.find(params[:id])
  end

  private


  def item_params
    params.require(:item).permit(:name, :description, :user_id, :price, :image)
  end

end
