class FavoriteSerializer < ActiveModel::Serializer
  attribute :id
  # has_one :user
  attribute :movie do
    object.movie
  end

end
