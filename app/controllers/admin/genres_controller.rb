class Admin::GenresController < ApplicationController

  def index
  @genre = Genre.all
  @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admin_genres_path
    flash[:success] = "編集できました。"
    else
      flash[:danger] = "編集できませんでした。"
    render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:id, :name, :created_at, :updated_at)
  end
end