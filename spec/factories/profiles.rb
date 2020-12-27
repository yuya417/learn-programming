FactoryBot.define do
  factory :profile do
    introduction { Faker::Lorem.characters(number: 30) }
  end
end