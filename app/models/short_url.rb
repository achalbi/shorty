# == Schema Information
#
# Table name: short_urls
#
#  id           :integer          not null, primary key
#  original_url :string
#  shorty       :string
#  user_id      :integer
#  visits_count :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShortUrl < ApplicationRecord
	REGEX_URL_PROTOCOL = Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
  
  belongs_to :user
  validates_uniqueness_of :shorty
  validates_associated :short_visits

  has_many :short_visits, dependent: :delete_all

  self.per_page = 5

  def self.generate_shorty
  	SecureRandom.base58(5)
  end

  def short_url
  	ENV['root_url']+self.shorty
  end

  # ensure the url starts with it protocol and is normalized
  def normalized_url
  	"http://#{self.original_url}" unless self.original_url=~/^https?:\/\//
  end
end
