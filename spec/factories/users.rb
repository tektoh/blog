# == Schema Information
#
# Table name: users
#
#  id               :bigint(8)        not null, primary key
#  name             :string(255)      not null
#  crypted_password :string(255)
#  avatar           :string(255)
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
    
  end
end
