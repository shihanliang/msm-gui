class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "directors/index" })
  end

  def show
    the_id = params.fetch("the_id")
    @director = Director.find(the_id)
    @filmography = Movie.where({ :director_id => @director.id })
    render({ :template => "directors/show" })
  end

  def create
    new_director = Director.new
    new_director.name = params.fetch("query_name")
    new_director.dob = params.fetch("query_dob")
    new_director.bio = params.fetch("query_bio")
    new_director.image = params.fetch("query_image")
    new_director.save

    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("the_id")
    director = Director.find(the_id)

    director.name = params.fetch("query_name")
    director.dob = params.fetch("query_dob")
    director.bio = params.fetch("query_bio")
    director.image = params.fetch("query_image")
    director.save

    redirect_to("/directors/#{director.id}")
  end

  def destroy
    the_id = params.fetch("the_id")
    director = Director.find(the_id)
    director.destroy

    redirect_to("/directors")
  end

  def eldest
    @the_eldest_director = Director.where.not(dob: nil).order(dob: :asc).first
    render({ :template => "directors/eldest" })
  end

  def youngest
    @the_youngest_director = Director.where.not(dob: nil).order(dob: :desc).first
    render({ :template => "directors/youngest" })
  end
end
