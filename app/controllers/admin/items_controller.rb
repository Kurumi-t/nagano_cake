class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  endS

  def new
    @item = Item.new
  end

  def create
    #genre_id = Genre.find_by(name: params[:item][:genre_id])
    #Item.create(item_params.merge(genre_id: genre_id))
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find_by(id: @item.genre_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Items.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end