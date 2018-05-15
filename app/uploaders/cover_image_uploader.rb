class CoverImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage Settings.carrierwave.storage.to_sym

  process resize_to_limit: [1200, 630]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def default_url
    ActionController::Base.helpers.asset_path('cover.jpg')
  end

  private

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
