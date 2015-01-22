class Attachment < ActiveRecord::Base
  OLD_AFTER = 10.minutes

  mount_uploader :file, FileUploader

  scope :old, -> { where('created_at < ?', Time.now - OLD_AFTER) }

  validates :file, presence: true

  def filename
    return unless file.present?
    File.basename(file.path)
  end

  def file_data
    return unless file.present?
    file.read
  end
end
