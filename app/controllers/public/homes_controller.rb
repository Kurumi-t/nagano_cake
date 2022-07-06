class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
    @genres = Genre.all
    @items = Item.all
  end

  def about
  end
end
