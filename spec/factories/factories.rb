FactoryBot.define do
  Faker::Config.locale = :ja
  I18n.config.available_locales << :en

  sequence(:name) { Faker::Base.with_locale(:en) { Faker::Name.first_name } }
  sequence(:email) { Faker::Internet.email }
  sequence(:password) { Faker::Internet.password(8) }
  sequence(:slug) { Faker::Base.with_locale(:en) { Faker::Internet.slug(nil, %w[- _].sample) } }
  sequence(:time) { Faker::Time.between(Time.current - 1.day, Time.now) }
  sequence(:title) { Faker::Lorem.sentence }
  sequence(:description) { Faker::Lorem.paragraph }
  sequence(:category) { Faker::Coffee.blend_name }
  sequence(:uuid) { SecureRandom.uuid }
end
