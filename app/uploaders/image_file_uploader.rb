class ImageFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end

  process resize_to_fit: [1260, 840]

  # 拡張子のバリデーション
  def extension_white_list
    %w(.jpg .jpeg .png)
  end

  # ファイルサイズのバリデーション
  def size_range
    1..5.megabytes
  end
end
