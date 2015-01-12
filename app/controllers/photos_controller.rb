class PhotosController < ApplicationController
  respond_to :json, :html

  expose(:photo, attributes: :photo_params)
  expose(:photos) { Photo.all }

  def index
  end

  def show
    redirect_to photo.image.path
  end

  def create
    if photo.save
      response.location = photo_url photo
      render json: {}, status: :created #not returning resource becouse of size
    else
      render json: { errors: photo.errors }, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
