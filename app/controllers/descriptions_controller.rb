class DescriptionsController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_description, only: [:edit, :update]

  def new
    @@space = Space.find_by(id: params[:space_id])
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    @description.space = @@space
    if @description.save
      clear_flash
      next_page
    else
      render :new
    end
  end

  def edit
    set_description
  end

  def update
    set_description
    if @description.update(description_params)
      redirect_to edit_space_path(@description.space)
    else
      render :edit
    end
  end

  private

  def check_current_user
    description = Description.find(params[:id])
    render_404 unless description.space.user_id == current_user.id
  end

  def set_description
    @description = Description.find(params[:id])
  end

  def description_params
    params.require(:description).permit(:catch_copy, :overview, :about_facilities)
  end

  def next_page
    redirect_to edit_space_path(@@space) if params[:commit] == "保存して戻る"
    redirect_to new_space_image_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end

  def clear_flash
    flash.discard(:alert)
  end
end
