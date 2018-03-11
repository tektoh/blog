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

class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  has_many :medium_images, dependent: :destroy

  validates :file,
            file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: %w[image/jpeg image/png] }
end
