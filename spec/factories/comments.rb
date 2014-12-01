FactoryGirl.define do
  factory :comment do
    content "MyText"
    user nil
    match_request nil
  end
end
