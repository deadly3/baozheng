CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAIHIWVL6XSG2FBBJA"],      # 你的 key


      aws_secret_access_key: ENV["KWBq6NYAm9dBdSrROeE3dbXtekve2LastdZTu0oh"],      # 你的 secret key


      region:                'us-west-2' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["baozheng101"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
