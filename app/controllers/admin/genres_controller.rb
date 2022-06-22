class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = genre.new
    genre.save
    redirect_to 'index'
  end

  def edit
  end

  def update
  end
end
