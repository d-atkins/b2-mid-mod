class MovieActorsController < ApplicationController
  def create
    actor = Actor.where(name: params[:name]).take
    MovieActor.create!(movie_id: params[:movie_id], actor_id: actor.id) if actor
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
