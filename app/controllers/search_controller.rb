class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.all.page(params[:page]).per(20)
    if params[:purpose]
      @spaces = @spaces.joins(basic_info: [:purpose]).where("#{params[:purpose]} = ?", 1).page(params[:page]).per(20)
    end
    pref = EquipmentInfo.prefectures.select{|n| n == params[:prefecture_key]}.values[0]
    appr = Plan.reservation_approval_methods.select{|n| n == params[:approval_method_key]}.values[0]
    unless params[:prefecture_key].blank?
      @spaces = @spaces.joins(:equipment_info).where('prefecture LIKE(?)', "#{ pref }").page(params[:page]).per(20)
    end
    unless params[:price_min_key].blank?
      @spaces = @spaces.joins(:plan).where('price_per_day > ?', "#{ params[:price_min_key] }").page(params[:page]).per(20)
    end
    unless params[:price_max_key].blank?
      @spaces = @spaces.joins(:plan).where('price_per_day < ?', "#{ params[:price_max_key] }").page(params[:page]).per(20)
    end
    unless params[:capacity_key].blank?
      @spaces = @spaces.joins(:basic_info).where('capacity > ?', "#{ params[:capacity_key] }").page(params[:page]).per(20)
    end
    unless params[:approval_method_key].blank?
      @spaces = @spaces.joins(:plan).where('reservation_approval_method = ?', "#{ appr }").page(params[:page]).per(20)
    end
    purposes = %w(party meeting photo_shoot film_shoot event performance studio sports office wedding other)
    purposes.each do |purpose|
      if request.referer.include?("purpose=#{purpose}")
        @spaces = @spaces.joins(basic_info: [:purpose]).where("#{purpose} = ?", 1).page(params[:page]).per(20)
      end
    end

  end
end
