FactoryBot.define do
  factory :item do
    title            { Faker::Commerce.product_name }
    text             { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    condition_id     { Faker::Number.between(from: 2, to: 6) }
    shipping_id      { Faker::Number.between(from: 2, to: 3) }
    region_id        { Faker::Number.between(from: 1, to: 47) }
    schedule_date_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
