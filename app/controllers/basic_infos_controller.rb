class BasicInfosController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_basic_info, only: [:edit, :update]
  
  def new
    @space_id = params[:space_id]
    @basic_info = BasicInfo.new
    @basic_info.build_purpose
  end

  def create
    @basic_info = BasicInfo.new(basic_info_params)
    if @basic_info.save
      next_page
    else
      set_space_id
      render :new
    end
  end

  def edit
  end

  def update
    if @basic_info.update(basic_info_params)
      redirect_to edit_space_path(@basic_info.space)
    else
      set_space_id
      render :edit
    end
  end

  private

  def check_current_user
    basic_info = BasicInfo.find(params[:id])
    render_404 unless basic_info.space.user_id == current_user.id
  end

  def set_basic_info
    @basic_info = BasicInfo.find(params[:id])
  end

  def basic_info_params
    params.require(:basic_info).permit(
      :capacity, :floor_space, :starting_of_reservation, :passig_key_method, :deadline_of_reservation, :space_id,
      purpose_attributes: [:id, :party, :meeting, :photo_shoot, :film_shoot, :event, :performance, :studio, :sports, :office, :wedding, :other]
    )
  end

  def set_space_id
    @space_id = params[:basic_info][:space_id]
  end

  def next_page
    redirect_to edit_space_path(@basic_info.space_id) if params[:commit] == "保存して戻る"
    redirect_to new_description_path(space_id: @basic_info.space_id) if params[:commit] == "保存して進む"
  end
end
