class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage Settings.carrierwave.storage.to_sym

  process :save_content_type_and_size_in_model

  version :icon do
    process resize_to_fill: [128, 128]
  end

  version :sm do
    process resize_to_limit: [300, 300]
  end

  version :md do
    process resize_to_limit: [800, 800]
  end

  version :lg do
    process resize_to_limit: [1200, 800]
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

  def save_content_type_and_size_in_model
    return self unless file && model && model.has_attribute?(:content_type)
    model.content_type = file.content_type if file.content_type
    model.file_size = file.size
  end
end
