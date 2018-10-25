class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.all.page(params[:page]).per(20)
    pref = EquipmentInfo.prefectures.select{|n| n == params[:prefecture_key]}.values[0]
    appr = Plan.reservation_approval_methods.select{|n| n == params[:approval_method_key]}.values[0]
    unless params[:prefecture_key].blank?
      @spaces = @spaces.joins(:equipment_info).where('prefecture LIKE(?)', "#{ pref }").page(params[:page]).per(20)
      @exit_prefecture_key = params[:prefecture_key]
    end
    unless params[:price_min_key].blank?
      @spaces = @spaces.joins(:plan).where('price_per_day > ?', "#{ params[:price_min_key] }").page(params[:page]).per(20)
      @exit_price_min_key = params[:price_min_key]
    end
    unless params[:price_max_key].blank?
      @spaces = @spaces.joins(:plan).where('price_per_day < ?', "#{ params[:price_max_key] }").page(params[:page]).per(20)
      @exit_price_max_key = params[:price_max_key]
    end
    unless params[:capacity_key].blank?
      @spaces = @spaces.joins(:basic_info).where('capacity > ?', "#{ params[:capacity_key] }").page(params[:page]).per(20)
      @exit_capacity_key = params[:capacity_key]
    end
    unless params[:approval_method_key].blank?
      @spaces = @spaces.joins(:plan).where('reservation_approval_method = ?', "#{ appr }").page(params[:page]).per(20)
      @exit_approval_method_key = params[:approval_method_key]
    end
    unless params[:purpose_key].blank?
      @spaces = @spaces.joins(basic_info: [:purpose]).where("#{params[:purpose_key]} = ?", 1).page(params[:page]).per(20)
      @exit_purpose_key = params[:purpose_key]
      gon.purpose_key = params[:purpose_key]
    end
    purposes = %w(party meeting photo_shoot film_shoot event performance studio sports office wedding other)
    purposes.each do |purpose|
      if request.url.include?("purpose_key=#{purpose}")
        @spaces = @spaces.joins(basic_info: [:purpose]).where("#{purpose} = ?", 1).page(params[:page]).per(20)
        @exit_purpose_key = purpose
        gon.purpose_key = purpose
      end
    end
  end
end
