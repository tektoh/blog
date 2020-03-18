# frozen_string_literal: true

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
  include UserName, UserRole, CryptedPassword, HasAvatar

  acts_as_paranoid
  authenticates_with_sorcery!
end
