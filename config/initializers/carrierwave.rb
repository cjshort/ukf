CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/"
  config.storage = :fog
  config.permissions = 0666
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAI73SOZHKF5AEEADA',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory = "ukfranchise"
end