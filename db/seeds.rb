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

def getPoster(movie_info)
    if movie_info["poster_path"]
        poster = "https://image.tmdb.org/t/p/w500" + movie_info["poster_path"]
    else
        poster = "https://r9u8a7x4.stackpathcdn.com/wp-content/uploads/2016/06/netflix.jpg"
    end
    return poster
end

def getBackground(movie_info)
    if movie_info["backdrop_path"]
        background = "https://image.tmdb.org/t/p/original" + movie_info["backdrop_path"]
    else
        background = "https://assets.brand.microsites.netflix.io/assets/493f5bba-81a4-11e9-bf79-066b49664af6_cm_1440w.png?v=41"
    end
    return background
end

def getTrailer(movie_info)
    if movie_info["videos"]["results"].empty?
        trailer = "oHg5SJYRHA0"
    else
        trailer = movie_info["videos"]["results"][0]["key"]
    end
    return trailer
end

count = 1
while count < 20 do

    case count
    when 1
        puts " "
        puts "Beginning to seed data...please be patient...🌱"
        puts " "
    when 150
        puts "Just getting started...🍀"
        puts " "
    when 250
        puts "25% complete 🌿"
        puts " "
    when 500
        puts "50% complete 🌵"
        puts " "
    when 650
        puts "Yes, still seeding...but growing 🌴"
        puts " "
    when 750
        puts "75% complete 🌳"
        puts " "
    when 900
        puts "¡AlMoSt ThErE! 🌲"
        puts " "
    when 999
        puts "🎉 🎊 🥳 🎉 🎊 🥳 🎉 🎊 🥳 🎉"
        puts "YOU DID IT! 🎄 Happy Holidays!"
        puts "🎉 🎊 🥳 🎉 🎊 🥳 🎉 🎊 🥳 🎉"
    end

    begin 
        movie_info = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/#{count}?#{key}&language=en-US&append_to_response=videos"))

        title = movie_info["original_title"]
        description = movie_info["overview"]
        genres = movie_info["genres"].map { |genre| genre["name"] }
        rating = movie_info["vote_average"]
        runtime = movie_info["runtime"]
        poster = getPoster(movie_info)
        trailer = getTrailer(movie_info)
        background = getBackground(movie_info)

        # byebug
            Movie.create!(title: title,
            description: description,
            genres: genres,
            rating: rating,
            runtime: runtime,
            poster: poster,
            trailer: trailer,
            background: background
            )
            
        count += 1

    rescue RestClient::ExceptionWithResponse => e
        e.response
        count += 1
    end
end

movie_info = JSON.parse(RestClient.get("https://api.themoviedb.org/3/trending/movie/week?#{key}&append_to_response=videos"))

movie_info["results"].map do |movie|

    title = movie["original_title"]
    description = movie["overview"]
    genres = ["Popular"]
    rating = movie["vote_average"]
    runtime = 120
    poster = getPoster(movie)
    trailer = "oHg5SJYRHA0"
    background = getBackground(movie)

        Movie.create!(title: title,
        description: description,
        genres: genres,
        rating: rating,
        runtime: runtime,
        poster: poster,
        trailer: trailer,
        background: background
        )
    end