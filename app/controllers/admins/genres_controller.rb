class Admins::GenresController < ApplicationController
  def index
  	@new_genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if  @genre.is_valid == "true"
  		@genre.is_valid = true

  	elsif @genre.is_valid == "false"
  		  @genre.is_valid = false

  	end
  	if  @genre.save
	  	redirect_to admins_genres_path
	end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	redirect_to admins_genres_path(@genre)
  end
  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end
