# frozen_string_literal: true

# == Schema Information
#
# Table name: sites
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  subtitle    :string
#  og_image    :string
#  favicon     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cover_image :string
#  gtag        :text
#

class Site < ApplicationRecord
  mount_uploader :og_image, OgImageUploader
  mount_uploader :cover_image, CoverImageUploader
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
