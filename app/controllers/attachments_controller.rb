class AttachmentsController < ApplicationController
  respond_to :json, :html

  expose(:attachment, attributes: :attachment_params)
  expose(:attachments) { Attachment.all }

  def index
  end

  def show
    redirect_to attachment.file.path
  end

  def create
    if attachment.save
      response.location = attachment_url attachment
      render json: {}, status: :created #not returning resource becouse of size
    else
      render json: { errors: attachment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    status = attachment.destroy ? :ok : :unprocessable_entity
    head status
  end

  private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
