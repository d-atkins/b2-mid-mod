require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'from the movie show page' do
    it "I can fill out a form to add a new actor to the movie" do
      studio_1 = Studio.create!(name: "Sweet Films")
      movie_1 = Movie.create!(name: 'Rails is Great', creation_year: 2020, genre: 'satire', studio: studio_1)
      movie_2 = Movie.create!(name: 'Legend of Sal', creation_year: 1976, genre: 'action', studio: studio_1)
      actor_1 = Actor.create!(name: 'Mike Dao', age: 22)
      actor_2 = Actor.create!(name: 'Meg Stang', age: 20)
      actor_3 = Actor.create!(name: 'Tim Tyrell', age: 53)
      actor_4 = Actor.create!(name: 'Aurora Ziobrowski', age: 36)
      actor_5 = Actor.create!(name: 'Megan McMahon', age: 37)
      actor_1.movies << [movie_1, movie_2]
      movie_1.actors << [actor_2, actor_3, actor_4]

      visit "/movies/#{movie_1.id}"

      within('#new_actor_form') do
        expect(page).to have_content("Add an actor to this movie")

        fill_in 'Name', with: 'Megan McMahon'
        click_button  'Add Actor'
      end

      expect(current_path).to eq("/movies/#{movie_1.id}")
      within('#actors') { expect(page).to have_content(actor_5.name) }
    end
  end
end
