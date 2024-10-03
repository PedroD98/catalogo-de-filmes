class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: @director.id, status: :published)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name],
                    nationality: params[:director][:nationality],
                    birth_date: params[:director][:birth_date],
                    genre_id: params[:director][:genre_id],
                    biography: params[:director][:biography],
                  )

    if @director.save
      flash[:notice] = "Diretor(a) cadastrado(a) com sucesso."
      return redirect_to new_director_path
    end

    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(name: params[:director][:name],
                nationality: params[:director][:nationality],
                birth_date: params[:director][:birth_date],
                genre_id: params[:director][:genre_id],
                biography: params[:director][:biography],
              )

      flash[:notice] = "Diretor(a) editado(a) com sucesso."
      return redirect_to director_path(@director)
    end

    render :edit
  end
end
