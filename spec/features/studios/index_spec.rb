require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'from the studios index page' do
    it 'I see a list of all of the movie studios and their movies' do
      studio_1 = Studio.create!(name: "Sweet Films")
      studio_2 = Studio.create!(name: "Okay Films")
      movie_1 = Movie.create!(name: 'Rails is Great', creation_year: 2020, genre: 'satire', studio: studio_1)
      movie_2 = Movie.create!(name: 'Legend of Sal', creation_year: 1976, genre: 'action', studio: studio_1)
      movie_3 = Movie.create!(name: 'Dark Side of the Code', creation_year: 2000, genre: 'suspense', studio: studio_2)
      movie_4 = Movie.create!(name: 'Limes', creation_year: 2002, genre: 'educational', studio: studio_2)
      movie_5 = Movie.create!(name: 'Runnin Out of Ideas', creation_year: 1989, genre: 'inspiring', studio: studio_2)

      visit '/studios'

      within("#studio-#{studio_1.id}") do
        expect(page).to have_content(studio_1.name)
        expect(page).to have_content(movie_1.name)
        expect(page).to have_content(movie_2.name)
      end

      within("#studio-#{studio_2.id}") do
        expect(page).to have_content(studio_2.name)
        expect(page).to have_content(movie_3.name)
        expect(page).to have_content(movie_4.name)
        expect(page).to have_content(movie_5.name)
      end
    end
  end
end
