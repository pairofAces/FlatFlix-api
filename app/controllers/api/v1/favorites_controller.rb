class Api::V1::FavoritesController < ApplicationController
	skip_before_action :authorized

	def create
		favorite = Favorite.create(favorite_params)
		render json: favorite, status: :created
	end

	def destroy
		favorite = Favorite.find(params[:id])
		favorite.delete
	end

	private

	def favorite_params
		params.require(:favorite).permit(:user_id, :movie_id)
	end

end
