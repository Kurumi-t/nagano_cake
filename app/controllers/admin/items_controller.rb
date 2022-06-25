class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    genre_id = Genre.find_by(code: params[:item][:genre_id]).id
    Item.create(item_params.merge(genre_id: genre_id))
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:item_genre)
  end
end
