FactoryBot.define do
  factory :user do
    name { Faker::Internet.user_name(specifier: 3) }
    admin_level { 0 }
  end
end
