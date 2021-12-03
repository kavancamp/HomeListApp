CarrierWave.configure do |config| 
    config.fog_credentials = { 
    :provider               => 'AWS', 
    :region                 => 'us-east-2',
    :aws_access_key_id      => 'AKIASW7XMGNKPSZNZFOB', 
    :aws_secret_access_key  => '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',

    }
    config.fog_directory  = 'flatironprojectbucket27' 
    config.fog_public     = false
  end 

 