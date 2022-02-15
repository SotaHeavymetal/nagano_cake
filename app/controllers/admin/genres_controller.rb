class Admin::GenresController < ApplicationController

  def index
  @genre=Genre.new
  end

  def create
    @genre= Genre.new(genre_params)
    if @genre.save
    redirect_to genre_path(@genre)
    else
      @genres = Genre.all
      render 'genres/index'
    end
  end

  def edit
    @book=Genre.find(params[:id])
  end

  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to genre_path(@genre)
    else
    render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:id, :name, :created_at, :updated_at)
  end
end