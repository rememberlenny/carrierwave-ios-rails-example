class AttachmentDestroyer
  DESTROY_AFTER = 10.minutes

  class << self
    def perform(attachment_id)
      attachment = Attachment.find(attachment_id)
      attachment.destroy if attachment
    end

    handle_asynchronously :perform, run_at: proc { DESTROY_AFTER.from_now }
  end
end