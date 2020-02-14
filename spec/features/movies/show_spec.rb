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
      actor_2 = Actor.create!(name: 'Meg Stang', age: 20)
      actor_3 = Actor.create!(name: 'Tim Tyrell', age: 53)
      actor_4 = Actor.create!(name: 'Aurora Ziobrowski', age: 36)
      actor_1.movies << [movie_1, movie_2, movie_3, movie_4, movie_5]
      movie_1.actors << [actor_2, actor_3, actor_4]


      visit "/movies/#{movie_1.id}"

      within('#name') { expect(page)
        .to have_content(movie_1.name) }

      within('#creation_year') { expect(page)
        .to have_content("Creation year: #{movie_1.creation_year}") }

      within('#genre') { expect(page)
        .to have_content("Genre: #{movie_1.genre}") }

      expected = "#{actor_2.name}, #{actor_1.name}, #{actor_4.name}, and #{actor_3.name}"
      
      within('#actors') do
        expect(page).to have_content("Starring #{expected}")
      end

      within('#average_age') do
        expect(page).to have_content("Average age of all actors: #{movie_1.average_age_of_actors}")
      end
    end
  end
end
