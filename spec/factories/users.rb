FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  sequence :username do |n|
    "myusername#{n}"
  end

  factory :user do
    username
    email
    password '123456'
    password_confirmation '123456'
  end
end