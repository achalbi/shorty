# == Schema Information
#
# Table name: short_visits
#
#  id              :integer          not null, primary key
#  short_url_id    :integer
#  visitor_ip      :string
#  visitor_city    :string
#  visitor_state   :string
#  visitor_country :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ShortVisit < ApplicationRecord
  belongs_to :short_url, counter_cache: :visits_count 

  validates_presence_of :visitor_ip, :visitor_country	
end
