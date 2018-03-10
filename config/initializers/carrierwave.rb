if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
elsif Rails.env.staging? || Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :aws
    config.use_iam_profile = true
    config.aws_bucket = Settings.carrierwave.aws_bucket
    config.aws_acl    = Settings.carrierwave.aws_acl
    config.asset_host = Settings.carrierwave.asset_host
    config.aws_attributes = {
      expires: Settings.carrierwave.aws_attributes.expires,
      cache_control: Settings.carrierwave.aws_attributes.cache_control
    }
  end
end
