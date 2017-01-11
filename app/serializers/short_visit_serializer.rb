class ShortVisitSerializer < ActiveModel::Serializer
  attributes :id, :visitor_ip, :visitor_city, :visitor_state, :visitor_country
  has_one :short_url
end
