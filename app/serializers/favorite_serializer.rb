class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :favorite
  has_one :beer
  has_one :user
end
