FactoryBot.define do
  factory :match do
    name { Faker::Lorem.word }

    factory :match_and_teams do
      after :create do |match|
        match.teams << create(:team)
      end
    end
  end


end