# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    supported_extensions
  end

  def supported_extensions
    supported_video_extenstions + supported_audio_extenstions + supported_image_extenstions
  end

  def supported_video_extenstions
    %w(asf avi dvr-ms m1v mp2 mp2v mp4 mpe mpeg mpg mpv2 wm wmv)
  end
  def supported_audio_extenstions
    %w(acc aif aifc aiff asf au flac mp2 mp3 mpa snd wav wma)
  end
  def supported_image_extenstions
    %w(bmp dib emf gif jfif jpe jpeg jpg png tif tiff wmf)
  end

  # ----------------------------------------------------

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/files/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
