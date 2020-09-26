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
    poster
end

def getTrailer(movie_info)
    if movie_info["videos"]["results"].empty?
        trailer = "https://www.youtube.com/watch?v=oHg5SJYRHA0"
    else
        trailer = "https://www.youtube.com/watch?v=" + movie_info["videos"]["results"][0]["key"]
    end
    trailer
end

count = 1
while count < 1000 do

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

            Movie.create!(title: title,
            description: description,
            genres: genres,
            rating: rating,
            runtime: runtime,
            poster: poster,
            trailer: trailer
            )
            
        count += 1

    rescue RestClient::ExceptionWithResponse => e
        e.response
        count += 1
    end
end