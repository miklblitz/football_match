FactoryBot.define do
  factory :gamer do
    name { Faker::Lorem.word }
    age { Faker::Number.between(from: 20, to: 35) }
    team
  end
end