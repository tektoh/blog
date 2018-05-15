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

class User < ApplicationRecord
  include UserName
  include CryptedPassword
  include Role

  mount_uploader :avatar, AvatarUploader

  authenticates_with_sorcery!
  acts_as_paranoid

  validates :avatar,
            file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: %w[image/jpeg image/png] }
end
