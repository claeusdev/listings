class PagesController < ApplicationController
  def index
    @items = Item.all
  end

  def about
  end

  def contact
  end
end
