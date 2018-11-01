class SpacesController < ApplicationController

  before_action :set_space, except: [:index, :show]
  before_action :check_current_user, except: [:index, :show]

  def index
    @party_spaces = Space.published.party.by_likes_count.limit(3).order('id DESC')
    @meeting_spaces = Space.published.meeting.by_likes_count.limit(3).order('id DESC')
    @photo_shoot_spaces = Space.published.photo_shoot.by_likes_count.limit(3).order('id DESC')
    @film_shoot_spaces = Space.published.film_shoot.by_likes_count.limit(3).order('id DESC')
    @sports_spaces = Space.published.sports.by_likes_count.limit(3).order('id DESC')
    #いいね機能を実装後に修正する
    @favorite_spaces = Space.published.all.limit(3).order('id DESC')
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
    begin
      @space.update!(status: 1)
      redirect_to edit_space_path(@space)
    rescue ActiveRecord::RecordInvalid => e
      logger.error e
      redirect_to edit_space_path(@space), alert: '未入力の情報があります'
    end
  end

  def show
    clear_notice
    if Space.find(params[:id]).published?
      @space = Space.published.find(params[:id])
      if @space.space_image.image_files.sub.present?
        @sub_images = @space.space_image.image_files.sub
      else
        @sub_images = []
      end
      gon.map_key = ENV["MAP_KEY"]
      gon.markerData = []
      gon.markerData << { lat: @space.equipment_info.latitude, lng: @space.equipment_info.longitude }
      render :layout => 'space_show'
    else
      render_404
    end
  end


  def destroy
    @space.destroy
    redirect_to user_path(current_user)
  end

  private

  def check_current_user
    space = Space.find(params[:id])
    render_404 unless space.user_id == current_user.id
  end

  def set_space
    @space = Space.find(params[:id])
  end

  def clear_notice
    flash.discard(:notice)
  end
end
