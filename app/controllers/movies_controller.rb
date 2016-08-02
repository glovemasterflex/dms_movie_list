class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC")
    else
      @movies = Movie.all.order(:title)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :genre, :actors)
    end
end
