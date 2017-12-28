FactoryBot.define do
  factory :book do
    name          { Faker::Name.name }
    description   { Faker::Lorem.paragraph }
    isbn          { Faker::Code.isbn }
    published_at  { Faker::Date.between(1.year.ago, Time.zone.today) }
    author

    trait :unpublished do
      published_at { Faker::Date.between(1.month.from_now, 1.year.from_now) }
    end
  end
end
