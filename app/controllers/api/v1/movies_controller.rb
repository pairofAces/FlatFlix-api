class Api::V1::MoviesController < ApplicationController

	def index
		@movies = Movie.all
		render json: @movies
	end

	def show
		@movie = Movie.find(params[:id])
		render json: @movie
	end

	def genres
		@movies = []
		@genres
		Movie.find_each do |movie|
				if movie.genres.include?("Action")
					@movies.push(movie)
				end
			end
		render json: @movies
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :genres, :rating, :runtime)
	end

end