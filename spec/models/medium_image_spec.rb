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

require 'rails_helper'

RSpec.describe MediumImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
