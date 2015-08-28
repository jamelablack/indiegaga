class CoverUploader < CarrierWave::Uplaoder::Base
  include CarrierWave::MiniMagick

  version :med_version do
    process resize_to_fill [332, 472]
  end
end
