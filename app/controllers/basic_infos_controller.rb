class BasicInfosController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  
  def new
    @@space = Space.find_by(id: params[:space_id])
    @basic_info = BasicInfo.new
    @basic_info.build_purpose
  end

  def create
    @basic_info = BasicInfo.new(basic_info_params)
    @basic_info.space = @@space
    if @basic_info.save
      next_page
    else
      render :new
    end
  end

  def edit
    @basic_info = BasicInfo.find(params[:id])
  end

  def update
    basic_info = BasicInfo.find(params[:id])
    basic_info.update(basic_info_params) if basic_info.space.user_id == current_user.id
    redirect_to edit_space_path(equipment_info.space)
  end

  private
  def basic_info_params
    params.require(:basic_info).permit(
      :capacity, :floor_space, :starting_of_reservation, :passig_key_method, :deadline_of_reservation,
      purpose_attributes: [:id, :party, :meeting, :photo_shoot, :film_shoot, :event, :performance, :studio, :sports, :office, :wedding, :other]
    )
  end

  def next_page
    redirect_to edit_space_path(@@space) if params[:commit] == "保存して戻る"
    redirect_to new_description_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
