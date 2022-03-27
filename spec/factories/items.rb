FactoryBot.define do
  factory :item do
    #image               {Faker::Lorem.sentence}
    product_name        {Faker::Lorem.sentence}
    explanation         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    condition_id        {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    delivery_id         {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to:9_999_999)}
    association :user
    
  end
end
