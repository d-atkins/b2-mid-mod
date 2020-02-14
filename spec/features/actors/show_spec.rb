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

    it "I see a list of all actors an actor has worked with" do
      studio_1 = Studio.create!(name: "Sweet Films")
      studio_2 = Studio.create!(name: "Okay Films")
      movie_1 = Movie.create!(name: 'Rails is Great', creation_year: 2020, genre: 'satire', studio: studio_1)
      movie_2 = Movie.create!(name: 'Legend of Sal', creation_year: 1976, genre: 'action', studio: studio_1)
      movie_3 = Movie.create!(name: 'Dark Side of the Code', creation_year: 2000, genre: 'suspense', studio: studio_2)
      movie_4 = Movie.create!(name: 'Limes', creation_year: 2002, genre: 'educational', studio: studio_2)
      movie_5 = Movie.create!(name: 'Runnin Out of Ideas', creation_year: 1989, genre: 'inspiring', studio: studio_2)
      movie_6 = Movie.create!(name: "Where's Mike?", creation_year: 2016, genre: 'mystery', studio: studio_1)
      actor_1 = Actor.create!(name: 'Mike Dao', age: 22)
      actor_2 = Actor.create!(name: 'Meg Stang', age: 20)
      actor_3 = Actor.create!(name: 'Tim Tyrell', age: 53)
      actor_4 = Actor.create!(name: 'Aurora Ziobrowski', age: 36)
      actor_5 = Actor.create!(name: 'Megan McMahon', age: 37)
      actor_1.movies << [movie_1, movie_2, movie_3, movie_4, movie_5]
      movie_1.actors << [actor_2, actor_3]
      movie_2.actors << [actor_2, actor_3]
      movie_3.actors << [actor_2]
      movie_4.actors << [actor_3]
      movie_5.actors << [actor_2, actor_3]
      movie_6.actors << [actor_2, actor_3, actor_4, actor_5]

      expected = "#{actor_2}, and #{actor_3}"

      within('#worked_with') do
        expect(page).to have_content("#{actor_1.name} has worked with #{expected}")
      end



    end
  end
end
