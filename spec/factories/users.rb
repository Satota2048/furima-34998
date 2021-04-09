FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"名無"}
    last_name             {"権兵衛"}
    family_kana_name      {'カナ'}
    last_kana_name        {'デス'}
    birth                 {'1970-03-04'}
  end
end