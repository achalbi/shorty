class ShortUrl < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :shorty

  has_many :short_visits

  self.per_page = 5

  def self.generate_shorty
  	SecureRandom.base58(5)
  end
end
