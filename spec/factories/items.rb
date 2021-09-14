FactoryBot.define do
  factory :item do
    title { Faker::Lorem.words(number: 2) }
    price { Faker::Number.within(range: 30..300) }
    image { Faker::Internet.url }
    img_public_id { Faker::Internet.password(max_length: 10) }
  end
end
