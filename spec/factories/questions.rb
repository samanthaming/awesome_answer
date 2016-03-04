FactoryGirl.define do
  factory :question do
    association :category, factory: :category
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}"}
    body { Faker::Lorem.paragraphy }
  end
end
