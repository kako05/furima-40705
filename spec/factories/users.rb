FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.unique.name }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { person.last }
    first_name            { person.first }
    family_reading        { person.last.katakana }
    first_reading         { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
