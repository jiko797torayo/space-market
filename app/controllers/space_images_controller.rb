class SpaceImagesController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]
  before_action :set_space_image, only: [:edit, :update]

  def new
    @space_id = params[:space_id]
    @space_image = SpaceImage.new
    @space_image.image_files.build
  end

  def create
    @space_image = SpaceImage.new(space_image_params)

    # 0番目（メイン）のfileカラムにデータが無い場合のバリデーション
    upload_file = space_image_params[:image_files_attributes]["0"][:file]
    if upload_file == nil
      set_space_id
      redirect_to new_space_image_path(space_id: @space_id), alert: '画像を最低1枚選択してください' and return
    end

    @space_image.save
    next_page
  end

  def edit
    @main_image = @space_image.image_files.main.first
    @sub_images = @space_image.image_files.sub
  end

  def update
    if @space_image.update(space_image_params)
      redirect_to edit_space_path(@space_image.space_id)
    else
      set_space_id
      render :edit
    end
  end

  private

  def check_current_user
    space_image = SpaceImage.find(params[:id])
    render_404 unless space_image.space.user_id == current_user.id
  end

  def set_space_image
    @space_image = SpaceImage.find(params[:id])
  end

  def space_image_params
    params.require(:space_image).permit(:space_id, image_files_attributes: [:id, :file, :about_file, :status])
  end

  def set_space_id
    @space_id = params[:space_image][:space_id]
  end

  def next_page
    redirect_to edit_space_path(@space_image.space_id) if params[:commit] == "保存して戻る"
    redirect_to new_plan_path(space_id: @space_image.space_id) if params[:commit] == "保存して進む"
  end
end
