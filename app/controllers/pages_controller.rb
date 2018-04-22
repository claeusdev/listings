class PagesController < ApplicationController
  def index
    @items = Item.all
    set_meta_tags title: "Find things to buy and Sell your stuff online",
                   site: 'Smayas',
                   reverse: true,
                   description: "Find used and new items to buy and find buyers for your items easily and fast."
  end

  def about
  end

  def contact
  end
end
