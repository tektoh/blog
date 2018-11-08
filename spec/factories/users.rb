# == Schema Information
#
# Table name: users
#
#  id               :bigint(8)        not null, primary key
#  name             :string           not null
#  crypted_password :string
#  avatar           :string
#  role             :integer          default("writer")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deleted_at       :datetime
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_name        (name)
#

FactoryBot.define do
  factory :user do
    before(:create) { |user| user.password_confirmation = user.password }

    name { generate :slug }
    password { generate :password }

    trait :writer do
      role { 'writer' }
    end

    trait :editor do
      role { 'editor' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
