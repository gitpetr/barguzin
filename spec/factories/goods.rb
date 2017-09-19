FactoryGirl.define do
  factory :good do
    name 'MyName'
    comment 'MyComment'
  end

  factory :invalid_good, class: "Good" do
    name nil
    comment nil
  end
end
