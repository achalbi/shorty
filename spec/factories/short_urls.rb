FactoryGirl.define do
  factory :short_url do
    original_url "MyString"
    shorty "MyString"
    user nil
    visits_count 1
  end
end
