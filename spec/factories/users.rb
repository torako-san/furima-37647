FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                { Faker::Name.initialas(nuber: 2) }
    email                   { Faker::Internet.free_emeil }
    password                { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation   { password }
    family_name             { person.first.kanji }
    given_name              { person.last.kanji }
    family_name_kana        { person.first.katakana }
    given_name_kana         { person.last.katakana }
    date                    { Faker::Date.backward }
  end
end