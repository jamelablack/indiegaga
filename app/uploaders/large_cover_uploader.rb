class LargeCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagik

  version :large_version do
    process resize_to_fill: [665, 375]
  end
end
