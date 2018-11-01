class UsersController < ApplicationController
  before_action :check_current_user, only: [:show]
  def show
    @reservations = Reservation.where(user_id: params[:id]).order('day ASC')
    @spaces = Space.where(user_id: params[:id])
  end

  private
  def check_current_user
    render_404 unless user_signed_in? && (current_user.id == params[:id].to_i)
  end
end
