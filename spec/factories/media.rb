# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  media_type :integer          default("image"), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :medium do
    
  end
end
