FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth { Faker::Date.backward }
    first_name { "四月" }
    last_name { "春" }
    first_name_kana { "シガツ" }
    last_name_kana { "ハル"}
  end
end