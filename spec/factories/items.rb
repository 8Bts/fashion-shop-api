FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    price { Faker::Number.number(range: 30..300) }
  end
end