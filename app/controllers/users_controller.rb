class UsersController < ApplicationController

  def show
    @reservations = Reservation.where(user_id: params[:id])
    @spaces = Space.where(user_id: params[:id])
  end
end
