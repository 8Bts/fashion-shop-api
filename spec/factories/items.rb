FactoryBot.define do
  factory :item do
    title { Faker::Lorem.words(number: 2) }
    price { Faker::Number.within(range: 30..300) }
    image { Faker::Internet.url }
  end
end