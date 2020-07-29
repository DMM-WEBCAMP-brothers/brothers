class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  def create
    @genre = Genre.new(genre_params)
    # if  @genre.is_valid == "true"
    #   @genre.is_valid = true

    # elsif @genre.is_valid == "false"
    #     @genre.is_valid = false

    # end
    if @genre.save
      flash[:notice] = "Genre was successfully created."
      redirect_to admins_genres_path
    else
      flash[:notice] = "入力欄に誤りがあります"
      @new_genre = Genre.new
      @genres = Genre.all
      render 'index'
    end
  end

  def index
  	@new_genre = Genre.new
  	@genres = Genre.all
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
      flash[:notice] = "Genre was successfully created."
  	   redirect_to admins_genres_path(@genre)
    else
      flash[:notice] = "入力欄に誤りがあります"
      render 'edit'
    end
  end
  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end
