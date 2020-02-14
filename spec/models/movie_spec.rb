require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "methods" do
    before :each do
      @studio_1 = Studio.create!(name: "Sweet Films")
      @studio_2 = Studio.create!(name: "Okay Films")
      @movie_1 = Movie.create!(name: 'Rails is Great', creation_year: 2020, genre: 'satire', studio: @studio_1)
      @movie_2 = Movie.create!(name: 'Legend of Sal', creation_year: 1976, genre: 'action', studio: @studio_1)
      @movie_3 = Movie.create!(name: 'Dark Side of the Code', creation_year: 2000, genre: 'suspense', studio: @studio_2)
      @movie_4 = Movie.create!(name: 'Limes', creation_year: 2002, genre: 'educational', studio: @studio_2)
      @movie_5 = Movie.create!(name: 'Runnin Out of Ideas', creation_year: 1989, genre: 'inspiring', studio: @studio_2)
      @actor_1 = Actor.create!(name: 'Mike Dao', age: 22)
      @actor_2 = Actor.create!(name: 'Meg Stang', age: 20)
      @actor_3 = Actor.create!(name: 'Tim Tyrell', age: 53)
      @actor_4 = Actor.create!(name: 'Aurora Ziobrowski', age: 36)
      @actor_1.movies << [@movie_1, @movie_2, @movie_3, @movie_4, @movie_5]
      @movie_1.actors << [@actor_2, @actor_3, @actor_4]
    end

    after :each do
      MovieActor.destroy_all
      Actor.destroy_all
      Movie.destroy_all
      Studio.destroy_all
    end

    it 'actors_by_age' do
      expected = [@actor_2, @actor_1, @actor_4, @actor_3]
      expect(@movie_1.actors_by_age).to eq(expected)
    end

    it "average_age_of_actors" do
      expect(@movie_1.average_age_of_actors).to eq(32.75)
    end
  end
end
