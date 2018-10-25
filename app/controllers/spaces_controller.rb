class SpacesController < ApplicationController
  before_action :check_current_user, only: :edit
  
  def index
    @party_spaces = Space.search_party_spaces.limit(3)
    @meeting_spaces = Space.search_meeting_spaces.limit(3)
    @photo_shoot_spaces = Space.search_photo_shoot_spaces.limit(3)
    @film_shoot_spaces = Space.search_film_shoot_spaces.limit(3)
    @sports_spaces = Space.search_sports_spaces.limit(3)
    #いいね機能を実装後に修正する
    @favorite_spaces = Space.all.limit(3)
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
