class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({ :template => "actors/index" })
  end

  def create
    new_actor = Actor.new
    new_actor.name = params.fetch("query_name")
    new_actor.image = params.fetch("query_image")
    new_actor.dob = params.fetch("query_dob")
    new_actor.bio = params.fetch("query_bio")
    new_actor.save

    redirect_to("/actors")
  end

  def show
    @actor = Actor.find(params.fetch("path_id"))
    @characters = @actor.characters
    @directors = @characters.map { |c| c.movie&.director }.compact.uniq

    render({ :template => "actors/show" })
  end

  def update
    actor = Actor.find(params.fetch("path_id"))
    actor.name = params.fetch("query_name")
    actor.image = params.fetch("query_image")
    actor.dob = params.fetch("query_dob")
    actor.bio = params.fetch("query_bio")
    actor.save

    redirect_to("/actors/#{actor.id}")
  end

  def destroy
    actor = Actor.find(params.fetch("path_id"))
    actor.destroy
    redirect_to("/actors")
  end
end
