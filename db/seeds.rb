# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MovieActor.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all
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
