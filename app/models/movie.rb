class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :movie
  has_many :movie_actors
  has_many :actors, through: :movie_actors
end
