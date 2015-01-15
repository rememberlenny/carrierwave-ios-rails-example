class Attachment < ActiveRecord::Base
  OLD_AFTER = 10.minutes

  mount_uploader :file, FileUploader

  scope :old, -> { where('created_at < ?', Time.now - OLD_AFTER) }

  validates :file, presence: true
end
