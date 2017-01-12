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
    short_url nil
    visitor_ip "MyString"
    visitor_city "MyString"
    visitor_state "MyString"
    visitor_country "MyString"
  end
end
