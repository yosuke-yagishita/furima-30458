FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'Abc012' }
    password_confirmation { password }
    family_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth { Faker::Date.birthday }
  end
end
