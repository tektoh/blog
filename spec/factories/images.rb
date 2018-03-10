# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  file         :string(255)
#  content_type :string(255)
#  file_size    :string(255)
#  title        :string(255)
#  width        :integer
#  height       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :image do
    
  end
end
