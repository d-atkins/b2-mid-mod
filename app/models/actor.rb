class Actor < ApplicationRecord
  validates_presence_of :name, :age
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def worked_with
    movies
      .joins(:actors)
      .where("actors.id != #{self.id}")
      .distinct
      .pluck("actors.name")
  end
end
