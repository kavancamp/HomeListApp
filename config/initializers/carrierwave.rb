CarrierWave.configure do |config| 
  config.fog_credentials = { 
  :provider               => 'AWS', 
  :region                 => 'us-east-2',
  #:aws_access_key_id      => 'Rails.application.credentials.aws[:access_key_id]', 
  #:aws_secret_access_key  => 'Rails.application.credentials.aws[:secret_access_key]',

  }
  #config.fog_directory  = 'flatironportfolio1' 
  
end 