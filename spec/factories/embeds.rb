# == Schema Information
#
# Table name: embeds
#
#  id         :bigint(8)        not null, primary key
#  embed_type :integer          default(0), not null
#  identifier :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :embed do
    
  end
end
