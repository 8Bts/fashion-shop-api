FactoryBot.define do
  factory :category do
    name { Faker::Internet.password(max_length: 10) }
  end
end
