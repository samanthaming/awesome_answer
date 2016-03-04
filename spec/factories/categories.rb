FactoryGirl.define do
  factory :category do
    name {Faker::Commerce.department(1)}
  end
end
