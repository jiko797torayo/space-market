class SpaceImagesController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  
  def new
    @@space = Space.find_by(id: params[:space_id])
    @space_image = SpaceImage.new
    @space_image.image_files.build
  end

  def create
    @space_image = SpaceImage.new(space_image_params)
    @space_image.space = @@space
    if @space_image.save
      next_page
    else
      render :new
    end
  end

  private
  def space_image_params
    params.require(:space_image).permit(image_files_attributes: [:id, :file, :about_file, :status])
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_plan_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
