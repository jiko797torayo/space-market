class SpacesController < ApplicationController
  def index
  end

  def edit
    @space = Space.find(params[:id])
    if @space.user_id == current_user.id
      render layout: 'new_space'
    else
      redirect_to root_path
    end
  end
end
