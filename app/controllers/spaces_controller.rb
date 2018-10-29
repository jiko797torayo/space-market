class SpacesController < ApplicationController

  before_action :check_current_user, only: [:edit, :update]
  before_action :set_space, only: [:edit, :update, :show]

  def index
    @party_spaces = Space.published.party.by_likes_count.limit(3)
    @meeting_spaces = Space.published.meeting.by_likes_count.limit(3)
    @photo_shoot_spaces = Space.published.photo_shoot.by_likes_count.limit(3)
    @film_shoot_spaces = Space.published.film_shoot.by_likes_count.limit(3)
    @sports_spaces = Space.published.sports.by_likes_count.limit(3)
    #いいね機能を実装後に修正する
    @favorite_spaces = Space.published.all.limit(3)
    #各目的別スペース登録数
    @spaces_count = Space.published.length
    @party_spaces_count = Space.published.party.length
    @meeting_spaces_count = Space.published.meeting.length
    @photo_shoot_spaces_count = Space.published.photo_shoot.length
    @film_shoot_spaces_count = Space.published.film_shoot.length
    @sports_spaces_count = Space.published.sports.length
  end

  def edit
    render layout: 'new_space'
  end

  def update
    if @space.update!(status: 1)
      redirect_to edit_space_path(@space)
    else
      render :edit
    end
  end

  def show
    @sub_images = @space.space_image.image_files.sub
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
