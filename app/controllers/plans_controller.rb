class PlansController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!

  def new
    @@space = Space.find_by(id: params[:space_id])
    @plan = Plan.new
    @plan.build_rental_day
    @plan.build_rental_hour
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.space = @@space
    if @plan.save
      redirect_to edit_space_path(@@space)
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params) if plan.space.user_id == current_user.id
    redirect_to edit_space_path(plan.space)
  end

  private
  def plan_params
    params.require(:plan).permit(
      :name, :about_plan, :price_per_hour, :price_per_day, :reservation_approval_method,
      rental_day_attributes: [:id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday],
      rental_hour_attributes: [:start_hour, :end_hour]
    )
  end
end
