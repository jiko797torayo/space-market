class SpacesController < ApplicationController
  def index
  end
  def show
    @space = Space.find(params[:id])
    @sub_images = @space.space_image.image_files.sub
  end
  private
end
