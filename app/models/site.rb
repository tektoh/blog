# == Schema Information
#
# Table name: sites
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  subtitle    :string(255)
#  og_image    :string(255)
#  favicon     :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Site < ApplicationRecord
  mount_uploader :og_image, OgImageUploader
  mount_uploader :favicon, FaviconUploader

  validates :name, presence: true, length: { maximum: 100 }
  validates :subtitle, length: { maximum: 100 }
  validates :description, length: { maximum: 400 }
  validates :og_image,
            file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: %w[image/jpeg image/png] }
  validates :favicon,
            file_size: { less_than_or_equal_to: 1.megabyte },
            file_content_type: { allow: %w[image/png] }
end
