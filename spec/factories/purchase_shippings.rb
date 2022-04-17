FactoryBot.define do
  factory :purchase_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08000000000' }
  end
end
