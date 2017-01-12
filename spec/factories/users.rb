# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user do
    name "Achal"
    sequence(:email) { |n| "achal#{n}@gmail.com"}
    password_digest "MyStringPassword"
    token "MyStringToken"
  end
end
