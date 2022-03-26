FactoryBot.define do
  factory :order_address do
    # PAYJP
    token               { "tok_abcdefghijk00000000000000000" }
    # フォームモデル
    post_code           { "345-6789" }
    delivery_area_id    { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Address.city }
    address_line        { Faker::Address.street_address }
    address_building    { Faker::Lorem.sentence }
    phone_number        { "09012345678" }
  end
end