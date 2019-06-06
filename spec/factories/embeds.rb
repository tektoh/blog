# == Schema Information
#
# Table name: embeds
#
#  id         :bigint(8)        not null, primary key
#  embed_type :integer          default(NULL), not null
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

FactoryBot.define do
  factory :embed do
    
  end
end
