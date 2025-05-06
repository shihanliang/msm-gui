class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render({ :template => "movies/index" })
  end

  def show
    the_id = params.fetch("the_id")
    @movie = Movie.find(the_id)
    render({ :template => "movies/show" })
  end

  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("query_title")
    new_movie.description = params.fetch("query_description", nil)
    new_movie.year = params.fetch("query_year", nil)
    new_movie.duration = params.fetch("query_duration", nil)
    new_movie.image = params.fetch("query_image", nil)
    new_movie.director_id = params.fetch("query_director_id")

    new_movie.save
    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("the_id")
    movie = Movie.find(the_id)

    movie.title = params.fetch("query_title", movie.title)
    movie.description = params.fetch("query_description", movie.description)
    movie.year = params.fetch("query_year", movie.year)
    movie.duration = params.fetch("query_duration", movie.duration)
    movie.image = params.fetch("query_image", movie.image)
    movie.director_id = params.fetch("query_director_id", movie.director_id)

    movie.save
    redirect_to("/movies/#{movie.id}")
  end

  def destroy
    the_id = params.fetch("the_id")
    movie = Movie.find(the_id)
    movie.destroy
    redirect_to("/movies")
  end
end
