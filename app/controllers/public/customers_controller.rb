class Public::CustomersController < ApplicationController
  def show
    @genres = Genre.all
    @items = Item.page(params[:page])
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def withdraw_update
  end
end
