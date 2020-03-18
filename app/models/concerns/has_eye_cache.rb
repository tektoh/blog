# frozen_string_literal: true

module HasEyeCache
  extend ActiveSupport::Concern

  included do
    mount_uploader :eye_cache, ImageUploader

    validates :eye_cache,
              file_size: { less_than_or_equal_to: 10.megabytes },
              file_content_type: { allow: %w[image/jpeg image/png] }
  end
end
