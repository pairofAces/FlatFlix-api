# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'rest-client'

key = ENV["api_key"]

count = 2 
while count < 5 do
    begin 
        movie_info = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/#{count}?#{key}&language=en-US"))
        title = movie_info["original_title"]
        description = movie_info["overview"]
        genres = movie_info["genres"].map { |genre| genre["name"] }
        rating = movie_info["vote_average"]
        runtime = movie_info["runtime"]

            movie = Movie.create(title: title,
            description: description,
            genres: genres,
            rating: rating,
            runtime: runtime
            )
            binding.pry
        count += 1
    rescue RestClient::ExceptionWithResponse => e
        e.response
        count += 1
    end
end