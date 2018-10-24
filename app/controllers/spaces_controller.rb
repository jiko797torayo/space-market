class SpacesController < ApplicationController
  before_action :check_current_user, only: :edit
  
  def index
  end

  def edit
    @space = Space.find(params[:id])
  end

  private

  def check_current_user
    space = Space.find(params[:id])
    render_404 unless space.user_id == current_user.id
  end
end
