# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  uuid       :string           not null
#  name       :string           not null
#  role       :integer          default("writer")
#  user_id    :integer
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
    
  end
end
