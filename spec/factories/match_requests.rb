FactoryGirl.define do
  factory :match_request do
    request_message "Hello"
    confirmed false
  end
end
