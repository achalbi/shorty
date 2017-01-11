class ShortUrlSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :shorty, :visits_count
  has_one :user
end
