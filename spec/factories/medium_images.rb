# == Schema Information
#
# Table name: medium_images
#
#  id         :bigint(8)        not null, primary key
#  medium_id  :bigint(8)
#  image_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_medium_images_on_image_id   (image_id)
#  index_medium_images_on_medium_id  (medium_id)
#

FactoryBot.define do
  factory :medium_image do
    
  end
end
