class ShortUrlSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :shorty, :visits_count
  has_one :user
  has_many :short_visits
end
