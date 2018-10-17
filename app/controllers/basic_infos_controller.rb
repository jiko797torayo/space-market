class BasicInfosController < ApplicationController
  layout 'new_space'
  
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

  private
  def basic_info_params
    params.require(:basic_info).permit(
      :capacity, :floor_space, :starting_of_reservation, :passig_key_method, :deadline_of_reservation,
      purpose_attributes: [:id, :party, :meeting, :photo_shoot, :film_shoot, :event, :performance, :studio, :sports, :office, :wedding, :other]
    )
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_description_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
