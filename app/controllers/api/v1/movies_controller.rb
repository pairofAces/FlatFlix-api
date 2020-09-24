class Api::V1::MoviesController < ApplicationController

	def index
		@movies = Movie.all
		render json: @movies
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :genres, :rating, :runtime)
	end

end