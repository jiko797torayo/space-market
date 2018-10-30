class DescriptionsController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_description, only: [:edit, :update]

  def new
    @space_id = params[:space_id]
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    if @description.save
      clear_flash
      next_page
    else
      set_space_id
      render :new
    end
  end

  def edit
  end

  def update
    if @description.update(description_params)
      redirect_to edit_space_path(@description.space)
    else
      set_space_id
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
    params.require(:description).permit(:catch_copy, :overview, :about_facilities, :space_id)
  end

  def set_space_id
    @space_id = params[:description][:space_id]
  end

  def next_page
    redirect_to edit_space_path(@description.space_id) if params[:commit] == "保存して戻る"
    redirect_to new_space_image_path(space_id: @description.space_id) if params[:commit] == "保存して進む"
  end

  def clear_flash
    flash.discard(:alert)
  end
end
