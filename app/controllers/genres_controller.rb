class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.where(genre_id: @genre.id, status: :published)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name],
                description: params[:genre][:description]
                )

    if @genre.save
      flash[:notice] = "Gênero cadastrado com sucesso."
      return redirect_to new_genre_path
    end

    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(name: params[:genre][:name],
              description: params[:genre][:description]
            )

      flash[:notice] = "Gênero editado com sucesso."
      return redirect_to genre_path(@genre)
    end

    render :edit
  end
end
