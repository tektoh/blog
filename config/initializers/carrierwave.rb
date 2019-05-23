# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
elsif Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :aws
    config.aws_bucket = Settings.carrierwave.aws_bucket
    config.aws_acl    = Settings.carrierwave.aws_acl
    config.asset_host = Settings.carrierwave.asset_host
    config.aws_attributes = {
      expires: Settings.carrierwave.aws_attributes.expires,
      cache_control: Settings.carrierwave.aws_attributes.cache_control
    }
    config.aws_credentials = {
      region: Settings.carrierwave.aws_credentials.region,
      aws_access_key_id: Settings.carrierwave.aws_credentials.aws_access_key_id,
      aws_secret_access_key: Settings.carrierwave.aws_credentials.aws_secret_access_key
    }
  end
end
