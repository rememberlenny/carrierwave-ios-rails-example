class AttachmentsController < ApplicationController
  expose(:attachments) { Attachment.all }

  private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
