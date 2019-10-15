# frozen_string_literal: true

class FaviconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :x16 do
    process resize_to_fill: [16, 16]
  end

  version :x32 do
    process resize_to_fill: [32, 32]
  end

  version :x48 do
    process resize_to_fill: [48, 48]
  end

  version :x152 do
    process resize_to_fill: [152, 152]
  end

  version :x192 do
    process resize_to_fill: [192, 192]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  private

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
    end
end
