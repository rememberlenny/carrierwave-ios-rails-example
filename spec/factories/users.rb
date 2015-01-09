FactoryGirl.define do
  sequence(:email) { |n| "ios_user-#{n}@sample.co" }

  factory :user do
    email
    password 'sample_password'
  end
end
