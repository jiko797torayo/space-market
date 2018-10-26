class SpacesController < ApplicationController
  layout 'new_space'

  before_action :check_current_user, only: [:edit, :update]
  before_action :set_space, only: [:edit, :update]
  
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
    set_space
  end

  def update
    set_space
    @space.status = 1
    if @space.save
      redirect_to edit_space_path(@space)
    else
      render :edit
    end
  end

  private

  def check_current_user
    space = Space.find(params[:id])
    render_404 unless space.user_id == current_user.id
  end

  def set_space
    @space = Space.find(params[:id])
  end
end
