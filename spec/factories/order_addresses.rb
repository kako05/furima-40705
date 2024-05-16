FactoryBot.define do
  factory :order_address do
    postcode  { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    region_id { Faker::Number.between(from: 1, to: 47) }
    city      { Faker::Address.city }
    house_num { Faker::Address.street_address }
    phone     { Faker::Number.leading_zero_number(digits: 11) }
    token     { Faker::Alphanumeric.alpha(number: 20) }
    association :user
    association :item
  end
end
