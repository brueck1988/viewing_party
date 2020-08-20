require 'faker'

FactoryBot.define do
  factory :user do
    username { "#{Faker::Games::WorldOfWarcraft.hero} #{Faker::Number.number(digits: 3)}" }
    uid { Faker::Number.within(range: 100000..999999) }
    google_token { Faker::Number.within(range: 100000..999999) }
    google_refresh_token { Faker::Number.within(range: 100000..999999) }
  end
end