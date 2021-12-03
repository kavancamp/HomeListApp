class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper
  
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit [100, 100]
  end

  #def extension_white_list
    # %w(jpg jpeg gif png pdf)
  #end

end
