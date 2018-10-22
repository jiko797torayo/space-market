class SpacesController < ApplicationController
  def index
  end

  def edit
    @space = Space.find(params[:id])
  end
end
