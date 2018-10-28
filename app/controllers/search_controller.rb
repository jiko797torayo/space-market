class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.prefecture_key(params[:prefecture_key]).price_min_key(params[:price_min_key]).price_max_key(params[:price_max_key]).capacity_key(params[:capacity_key]).approval_method_key(params[:approval_method_key]).purpose_key(request.url.scan(/purpose_key=([a-z_]+)/).join).page(params[:page]).per(20)
    parameter_keys = [:prefecture_key, :price_min_key, :price_max_key, :capacity_key, :approval_method_key, :purpose_key]
    parameter_keys.each do |parameter_key|
    end
    gon.purpose_key = request.url.scan(/purpose_key=([a-z_]+)/).join
  end
end
