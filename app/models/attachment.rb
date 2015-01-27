class Attachment < ActiveRecord::Base
  mount_uploader :file, FileUploader

  after_create :delayed_destroy
  validates :file, presence: true

  def filename
    return unless file.present?
    File.basename(file.path)
  end

  def file_data
    return unless file.present?
    file.read
  end

  private

  def delayed_destroy
    AttachmentDestroyer.perform(id)
  end
end
