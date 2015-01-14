class AttachmentsController < ApplicationController
  expose(:attachments) { Attachment.all }

  def index
  end

  private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
