FactoryBot.define do
  factory :purchase_buyer_info do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    address_line { '1-1' }
    building_name { 'ビルディング' }
    phone_num { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end