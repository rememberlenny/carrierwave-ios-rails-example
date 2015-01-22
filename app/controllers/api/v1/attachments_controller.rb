class API::V1::AttachmentsController < API::V1::ApiController
  expose(:attachment, attributes: :attachment_params)
  expose(:attachments) { Attachment.all }

  def index
    render json: attachments, status: :ok
  end

  def show
    render json: attachment, status: :ok
  end

  def download
    send_data attachment.file_data,
              filename: attachment.filename,
              disposition: 'attachment',
              status: :ok
  end

  def create
    if attachment.save
      response.location = api_v1_attachment_url attachment
      render json: attachment, status: :created
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
