FactoryGirl.define do
  factory :user do
    first_name "Ralph"
    last_name "Bot"
    sequence(:username) { |n| "user-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password_digest "password"
  end
end
