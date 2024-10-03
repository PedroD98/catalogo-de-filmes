class MoviesController < ApplicationController
  def index
    @released_movies = Movie.where(release_status: :released, status: :published)
    @upcoming_movies = Movie.where(release_status: :upcoming, status: :published)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(name: params[:movie][:name],
                    country_of_origin: params[:movie][:country_of_origin],
                    release_year: params[:movie][:release_year],
                    length: params[:movie][:length],
                    genre_id: params[:movie][:genre_id],
                    director_id: params[:movie][:director_id],
                    release_status: params[:movie][:release_status],
                    poster: params[:movie][:poster],
                    synopse: params[:movie][:synopse],
                  )

    if @movie.save
      flash[:notice] = "Filme cadastrado com sucesso."
      return redirect_to new_movie_path
    end

    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(name: params[:movie][:name],
                  country_of_origin: params[:movie][:country_of_origin],
                  release_year: params[:movie][:release_year],
                  length: params[:movie][:length],
                  genre_id: params[:movie][:genre_id],
                  director_id: params[:movie][:director_id],
                  release_status: params[:movie][:release_status],
                  poster: params[:movie][:poster],
                  synopse: params[:movie][:synopse],
                )

      flash[:notice] = "Filme editado com sucesso."
      return redirect_to movie_path(@movie)
    end

    render :edit
  end

  def publish
    movie = Movie.find(params[:id])
    movie.published!
    redirect_to movie_path(movie.id)
  end

  def withdraw_publication
    movie = Movie.find(params[:id])
    movie.draft!
    redirect_to movie_path(movie.id)
  end
end
