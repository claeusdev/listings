class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all
  end
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
    set_meta_tags title: @item.name,
                    site: 'Smayas',
                    reverse: true,
                    description: @item.description.truncate(200),
                    twitter: {
                        card: 'summary',
                        site: '@smayas',
                        title: @item.name,
                        creator: '@shopaholicks',
                        description: @item.description.truncate(200),
                        image: view_context.image_url(@item.image.url(:card))
                    },
                    og: {
                        title: "#{@item.name}",
                        description: @item.description.truncate(200),
                        type: 'website',
                        url: item_url(@item),
                        image: @item.image.url
                    }
  end

  private


  def item_params
    params.require(:item).permit(:name, :description, :user_id, :price, :image)
  end

end
