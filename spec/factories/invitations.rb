# == Schema Information
#
# Table name: invitations
#
#  id         :bigint(8)        not null, primary key
#  uuid       :string           not null
#  name       :string           not null
#  role       :integer          default("writer")
#  user_id    :bigint(8)
#  expires_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_invitations_on_deleted_at  (deleted_at)
#  index_invitations_on_user_id     (user_id)
#  index_invitations_on_uuid        (uuid) UNIQUE
#

FactoryBot.define do
  factory :invitation do
    name { generate :slug }

    trait :writer do
      role 'writer'
    end

    trait :editor do
      role 'editor'
    end

    trait :admin do
      role 'admin'
    end
  end
end
