CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  elsif ENV.key?('S3_KEY')
    config.storage = :fog

    # let's Carrierwave work on Heroku
    config.cache_dir = Rails.root + '/tmp/uploads'

    config.fog_credentials = {
        provider:               'AWS',
        aws_access_key_id:      ENV['S3_KEY'],
        aws_secret_access_key:  ENV['S3_SECRET']
    }

    config.fog_directory    = ENV['S3_BUCKET_NAME']
    config.fog_public       = false
  else
    config.storage = :file
  end
end
