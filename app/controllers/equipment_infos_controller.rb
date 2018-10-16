class EquipmentInfosController < ApplicationController
  layout 'new_space'
  
  def new
    @equipment_info = EquipmentInfo.new
  end

  def create
    equipment_info = EquipmentInfo.new(equipment_info_params)
    if equipment_info.save
      @space = Space.create(equipment_info_id: equipment_info.id)
      next_page
    else
      render :new
    end
  end

  private
  def equipment_info_params
    params.require(:equipment_info).permit(:postal_code, :prefecture, :city_name, :street_name, :building_name, :latitude, :longitude, :access, :phone_number, :equipment_type)
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_basic_info_path(@space) if params[:commit] == "保存して進む"
  end
end
