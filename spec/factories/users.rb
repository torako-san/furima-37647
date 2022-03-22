FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation   { password }
    family_name             { person.first.kanji }
    given_name              { person.last.kanji }
    family_name_katakana    { person.first.katakana }
    given_name_katakana     { person.last.katakana }
    birthday                { Faker::Date.backward }
  end
end