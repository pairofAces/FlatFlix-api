class WatchedSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
end
