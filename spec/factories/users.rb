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
    name { Faker::Name}
    email { Faker::Internet.email }
    password "MyPassword"
    password_confirmation "MyPassword"
    token "MyToken"


  end
end
