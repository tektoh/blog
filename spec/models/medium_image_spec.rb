# == Schema Information
#
# Table name: medium_images
#
#  id         :integer          not null, primary key
#  medium_id  :integer
#  image_id   :integer
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
