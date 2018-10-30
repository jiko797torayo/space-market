class EquipmentInfosController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_equipment_info, only: [:edit, :update]

  def new
    @equipment_info = EquipmentInfo.new
  end

  def create
    @equipment_info = EquipmentInfo.new(equipment_info_params)
    set_space
    if @equipment_info.save
      next_page
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @equipment_info.update(equipment_info_params)
      redirect_to edit_space_path(@equipment_info.space)
    else
      render :edit
    end
  end

  private

  def check_current_user
    equipment_info = EquipmentInfo.find(params[:id])
    render_404 unless equipment_info.space.user_id == current_user.id
  end

  def set_equipment_info
    @equipment_info = EquipmentInfo.find(params[:id])
  end

  def equipment_info_params
    params.require(:equipment_info).permit(:postal_code, :prefecture, :city_name, :street_name, :building_name, :latitude, :longitude, :access, :phone_number, :equipment_type)
  end

  def set_space
    @space = Space.new
    @equipment_info.space = @space
    @equipment_info.space.user_id = current_user.id 
  end

  def next_page
    redirect_to edit_space_path(@space) if params[:commit] == "保存して戻る"
    redirect_to new_basic_info_path(space_id: @space.id) if params[:commit] == "保存して進む"
  end
end
