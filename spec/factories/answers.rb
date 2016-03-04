FactoryGirl.define do
  factory :answer do
    sequence(:body) {|n| "#{Faker::Lorem.paragraph}-#{n}"}
    question nil
  end
end
