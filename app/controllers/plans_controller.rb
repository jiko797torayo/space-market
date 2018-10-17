class PlansController < ApplicationController
  layout 'new_space'

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
      if 0 <= @plan.rental_hour[:start_hour] && @plan.rental_hour[:end_hour] < 0
        @plan.rental_hour[:zero] == 1 
        @plan.save
      elsif 1 <= @plan.rental_hour[:start_hour] && @plan.rental_hour[:end_hour] < 2
        @plan.rental_hour[:one] == 1 
        @plan.save
      end
      next_page
    else
      render :new
    end
  end

  private
  def plan_params
    params.require(:plan).permit(
      :name, :about_plan, :price_per_hour, :price_per_day, :reservation_approval_method,
      rental_day_attributes: [:id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday],
      rental_hour_attributes: [:start_hour, :end_hour]
    )
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to root_path if params[:commit] == "保存して進む"
  end
end
