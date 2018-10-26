class ReservationsController < ApplicationController
  before_action :set_space
  def new
    @space = Space.find(params[:space_id])
    @reservation = Reservation.new
    gon.price = @space.plan.price_per_day
    gon.not_weekday = set_not_be_reserved_weekday(@space)
    gon.not_day = set_not_be_reserved_day(@space)
  end
  def create
    @reservation = Reservation.new(reserve_params)
    if @reservation.save
      redirect_to action: 'show', id: @reservation.id
    else
      redirect_to action: 'new'
    end
  end

  def show
    @reserve = @space.reservations.find(params[:id])
  end

  private

  def set_space
    @space = Space.find(params[:space_id])
  end
  def reserve_params
    params.require(:reservation).permit(:user_id, :space_id, :day)
  end

  def set_not_be_reserved_weekday(space)
    rental_weekday = space.plan.rental_day
    week = []
    set_weekday(week, rental_weekday)
    return week
  end

  def set_weekday(week, rental_weekday)
      sunday    = rental_weekday[:sunday]
      monday    = rental_weekday[:monday]
      tuesday   = rental_weekday[:tuesday]
      wednesday = rental_weekday[:wednesday]
      thursday  = rental_weekday[:thursday]
      friday    = rental_weekday[:friday]
      saturday  = rental_weekday[:saturday]
    if sunday == 0
      week << ".fc-day.fc-sun"
    end
    if monday == 0
      week << ".fc-day.fc-mon"
    end
    if tuesday == 0
      week << ".fc-day.fc-tue"
    end
    if wednesday == 0
      week << ".fc-day.fc-wed"
    end
    if thursday == 0
      week << ".fc-day.fc-thu"
    end
    if friday == 0
      week << ".fc-day.fc-fri"
    end
    if saturday == 0
      week << ".fc-day.fc-sat"
    end
    return week
  end

  def set_not_be_reserved_day(space)
    not_be_reserved_days = []
    reserved_days = space.reservations
    reserved_days.each do |reserved_day|
      not_be_reserved_days << "[data-date=#{reserved_day[:day]}]"
    end
    return not_be_reserved_days
  end

end
