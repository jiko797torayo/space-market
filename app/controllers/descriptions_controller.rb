class DescriptionsController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  
  def new
    @@space = Space.find_by(id: params[:space_id])
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    @description.space = @@space
    if @description.save
      next_page
    else
      render :new
    end
  end

  def edit
    @description = Description.find(params[:id])
  end

  def update
    description = Description.find(params[:id])
    description.update(description_params) if description.space.user_id == current_user.id
    redirect_to edit_space_path(description.space)
  end

  private
  def description_params
    params.require(:description).permit(:catch_copy, :overview, :about_facilities)
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_space_image_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
