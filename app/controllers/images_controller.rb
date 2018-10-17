class ImagesController < ApplicationController
  layout 'new_space'
  
  def new
    @@space = Space.find_by(id: params[:space_id])
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.space = @@space
    if @image.save
      next_page
    else
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit(:uri, :about_image)
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_plan_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
