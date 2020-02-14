class MovieActorsController < ApplicationController
  def create
    actor = Actor.where(name: params[:name]).take
    MovieActor.create!(movie_id: params[:movie_id], actor_id: actor.id)
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
