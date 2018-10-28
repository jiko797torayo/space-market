class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.prefecture_key(params[:prefecture_key]).price_min_key(params[:price_min_key]).price_max_key(params[:price_max_key]).capacity_key(params[:capacity_key]).approval_method_key(params[:approval_method_key]).purpose_key(params[:purpose_key]).page(params[:page]).per(20)
    parameter_keys = [:prefecture_key, :price_min_key, :price_max_key, :capacity_key, :approval_method_key, :purpose_key]
    parameter_keys.each do |parameter_key|
      unless params[parameter_key[0]].blank?
        @spaces = @spaces.joins(parameter_key[1]).where(parameter_key[2], parameter_key[3])
        instance_variable_set("@exit_#{ parameter_key[0].to_s }", params[parameter_key[0]])
      end
    end

    purposes = %w(party meeting photo_shoot film_shoot event performance studio sports office wedding other)
    purposes.each do |purpose|
      if request.url.include?("purpose_key=#{purpose}")
        @spaces = @spaces.joins(basic_info: [:purpose]).where("#{purpose} = ?", 1)
        @exit_purpose_key = purpose
        gon.purpose_key = purpose
      end
    end
  end
end
