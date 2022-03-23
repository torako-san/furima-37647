FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 5) }
    description         { Faker::Lorem.sentence }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    item_category_id    { Faker::Number.between(from: 2, to: 12) }
    item_status_id      { Faker::Number.between(from: 2, to: 7) }
    delivery_burden_id  { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id    { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id     { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
