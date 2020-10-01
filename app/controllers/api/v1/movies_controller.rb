class Api::V1::MoviesController < ApplicationController
	skip_before_action :authorized

	def index
		movies = Movie.all
		render json: movies
	end

	def show
		movie = Movie.find(params[:id])
		render json: movie
	end

	def genres
		movies = []
		genre = params[:genre].capitalize
		Movie.find_each do |movie|
			if movie.genres.include?(genre)
				movies.push(movie)
			end
		end
		render json: movies.shuffle
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :genres, :rating, :runtime, :poster, :trailer, :background)
	end

end