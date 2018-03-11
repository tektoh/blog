# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  file         :string
#  content_type :string
#  file_size    :string
#  title        :string
#  width        :integer
#  height       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :image do
    
  end
end
