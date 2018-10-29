class ImageFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]
  
  def allowed_file_types
    %w(.jpg .jpeg .png)
  end

  def size_range
    1..5.megabytes
  end
end
