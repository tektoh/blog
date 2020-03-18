# frozen_string_literal: true

class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :icon do
    process resize_to_fill: [128, 128]
  end

  version :sm do
    process resize_to_limit: [300, 300]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def default_url
    ActionController::Base.helpers.asset_path("icon.png")
  end

  private
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
    end
end
