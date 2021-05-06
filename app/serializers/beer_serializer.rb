class BeerSerializer < ActiveModel::Serializer
  attributes :id, :beer_id, :seen_at
  has_one :user
end
