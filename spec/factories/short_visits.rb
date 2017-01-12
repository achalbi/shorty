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

FactoryGirl.define do
  factory :short_visit do
    association :short_url
    visitor_ip "1.1.1.1"
    visitor_city "Bengaluru"
    visitor_state "KA"
    visitor_country "IND"
  end
end
