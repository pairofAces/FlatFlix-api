class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create, :favorites, :index]

	def profile
		render json: { user: UserSerializer.new(current_user) }, status: :accepted
	end

	def index
		users = User.all
		render json: users
	end

	def create
		@user = User.create(user_params)

		if @user.valid?
			@token = encode_token({ user_id: @user.id })
			render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
		else
			render json: { error: 'failed to create user' }, status: :not_acceptable
		end
	end

	def favorites
		user = User.find(params[:id])
		user_favorites = user.favorites.uniq { |movie| movie.movie_id }
		favorites = user.favorites.map do |favorite|
			if favorite.movie_id != nil
				Movie.find(favorite.movie_id)
			end
		end

		render json: { movies: favorites.uniq, favorites: user_favorites } 
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
	
end
