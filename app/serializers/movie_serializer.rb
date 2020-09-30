class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :rating, :runtime, :poster, :trailer, :background
end
