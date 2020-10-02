class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :favorites
  has_many :movies, through: :favorites
end
