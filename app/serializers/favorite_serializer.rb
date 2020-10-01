class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :user_id
  has_one :user
  has_one :movie
end
