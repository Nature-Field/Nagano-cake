class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    else
      render :index
    end
  end
  
  def update
  end
  
  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
