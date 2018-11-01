class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.published.prefecture_key(params[:prefecture_key]).price_min_key(params[:price_min_key]).price_max_key(params[:price_max_key]).capacity_key(params[:capacity_key]).approval_method_key(params[:approval_method_key]).purpose_key(request.url.scan(/purpose_key=([a-z_]+)/).join).page(params[:page]).per(20).order('id DESC')
    parameter_keys = [:prefecture_key, :price_min_key, :price_max_key, :capacity_key, :approval_method_key, :purpose_key]
    parameter_keys.each do |parameter_key|
      instance_variable_set("@exit_#{ parameter_key.to_s }", params[parameter_key]) if params[parameter_key].present?
    end
    gon.purpose_key = request.url.scan(/purpose_key=([a-z_]+)/).join

    #map.jsに検索結果に表示されているスペースの経度・緯度を渡す
    gon.map_key = ENV["MAP_KEY"]
    gon.markerData = []
    @spaces.each do |space|
      gon.markerData << { lat: space.equipment_info.latitude, lng: space.equipment_info.longitude }
    end
  end
end
