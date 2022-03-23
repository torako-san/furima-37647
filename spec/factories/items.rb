FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 5) }
    description         { Faker::Lorem.sentence }
    price               { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end