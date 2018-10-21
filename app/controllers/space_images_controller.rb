class SpaceImagesController < ApplicationController
  layout 'new_space'

  before_action :authenticate_user!
  
  def new
    @@space = Space.find_by(id: params[:space_id])
    @space_image = SpaceImage.new
    @space_image.image_files.build
  end

  def create
    @space_image = SpaceImage.new(space_image_params)
    @space_image.space = @@space

    # 0番目（メイン）のfileカラムにデータが無い場合のバリデーション 
    upload_file = space_image_params[:image_files_attributes]["0"][:file]
    if upload_file == nil
      redirect_to new_space_image_path(space_id: @@space.id), notice: '画像を最低1枚選択してください' and return
    end
    
    @space_image.save
    next_page
  end

  private
  def space_image_params
    params.require(:space_image).permit(image_files_attributes: [:id, :file, :about_file, :status])
  end

  def next_page
    redirect_to root_path if params[:commit] == "保存して戻る"
    redirect_to new_plan_path(space_id: @@space.id) if params[:commit] == "保存して進む"
  end
end
