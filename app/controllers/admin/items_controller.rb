class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    #genre_id = Genre.find_by(code: params[:item][:genre_id]).id
    #Item.create(item_params.merge(genre_id: genre_id))
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end