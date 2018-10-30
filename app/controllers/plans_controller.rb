class PlansController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_plan, only: [:edit, :update]

  def new
    @space_id = params[:space_id]
    @plan = Plan.new
    @plan.build_rental_day
    @plan.build_rental_hour
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to edit_space_path(@plan.space_id)
    else
      set_space_id
      render :new
    end
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to edit_space_path(@plan.space_id)
    else
      set_space_id
      render :edit
    end
  end

  private

  def check_current_user
    plan = Plan.find(params[:id])
    render_404 unless plan.space.user_id == current_user.id
  end
  
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
  params.require(:plan).permit(
    :name, :about_plan, :price_per_hour, :price_per_day, :reservation_approval_method, :space_id,
    rental_day_attributes: [:id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday],
    rental_hour_attributes: [:start_hour, :end_hour]
  )
  end

  def set_space_id
    @space_id = params[:plan][:space_id]
  end
end
