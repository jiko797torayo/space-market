class SpacesController < ApplicationController
  before_action :check_current_user, only: :edit
  
  def index
    @party_spaces = Space.party.by_likes_count.limit(3)
    @meeting_spaces = Space.meeting.by_likes_count.limit(3)
    @photo_shoot_spaces = Space.photo_shoot.by_likes_count.limit(3)
    @film_shoot_spaces = Space.film_shoot.by_likes_count.limit(3)
    @sports_spaces = Space.sports.by_likes_count.limit(3)
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
