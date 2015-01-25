class Attachment < ActiveRecord::Base
  mount_uploader :file, FileUploader

  DESTROY_DELAY = 10.minutes

  validates :file, presence: true

  scope :old, -> { where('created_at < ?', Time.now - DESTROY_DELAY) }

  def filename
    return unless file.present?
    File.basename(file.path)
  end

  def file_data
    return unless file.present?
    file.read
  end
end
