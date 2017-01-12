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

FactoryGirl.define do
  factory :short_url do
    original_url { Faker::Internet.url }
    sequence(:shorty) { |n| "abcd{n}" }
    visits_count 1
    user_id 1
  end
end
