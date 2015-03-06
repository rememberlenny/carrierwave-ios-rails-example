class Attachment < CarrierwaveIosRails::Attachment
  after_create :delayed_destroy

  private

  def delayed_destroy
    AttachmentDestroyer.perform(id)
  end
end
