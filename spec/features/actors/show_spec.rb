require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'from the actors show page' do
    it "I see the actor's information and the movies they were in" do
      studio_1 = Studio.create!(name: "Sweet Films")
      studio_2 = Studio.create!(name: "Okay Films")
      movie_1 = Movie.create!(name: 'Rails is Great', creation_year: 2020, genre: 'satire', studio: studio_1)
      movie_2 = Movie.create!(name: 'Legend of Sal', creation_year: 1976, genre: 'action', studio: studio_1)
      movie_3 = Movie.create!(name: 'Dark Side of the Code', creation_year: 2000, genre: 'suspense', studio: studio_2)
      movie_4 = Movie.create!(name: 'Limes', creation_year: 2002, genre: 'educational', studio: studio_2)
      movie_5 = Movie.create!(name: 'Runnin Out of Ideas', creation_year: 1989, genre: 'inspiring', studio: studio_2)
      actor_1 = Actor.create!(name: 'Mike Dao', age: 22)
      actor_1.movies << [movie_1, movie_2, movie_3, movie_4, movie_5]

      visit "/actors/#{actor_1.id}"

      within('#name') { expect(page).to have_content(actor_1.name) }
      within('#age') { expect(page).to have_content("Age: #{actor_1.age}") }

      within('#movies') do
        expect(page).to have_content("Movies #{actor_1.name} was in:")
        expect(page).to have_content(movie_1.name)
        expect(page).to have_content(movie_2.name)
        expect(page).to have_content(movie_3.name)
        expect(page).to have_content(movie_4.name)
        expect(page).to have_content(movie_5.name)
      end
    end
  end
end
