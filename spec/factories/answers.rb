FactoryGirl.define do
  factory :answer do
    association :question, factory: :question
    sequence(:body) {|n| "#{Faker::Lorem.paragraph}-#{n}"}
  end
end
