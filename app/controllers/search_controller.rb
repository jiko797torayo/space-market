class SearchController < ApplicationController
  layout 'search'
  def index
  end

  def search
    @spaces = Space.all.page(params[:page]).per(20)
    # appr = Plan.reservation_approval_methods.select{|n| n == params[:approval_method_key]}.values[0]
    parameter_keys = [
                      [:prefecture_key,      :equipment_info,          'prefecture LIKE(?)',              params[:prefecture_key]       ],
                      [:price_min_key,       :plan,                    'price_per_day > ?',               params[:price_min_key]        ],
                      [:price_max_key,       :plan,                    'price_per_day < ?',               params[:price_max_key]        ],
                      [:capacity_key,        :basic_info,              'capacity >= ?',                   params[:capacity_key]         ],
                      [:approval_method_key, :plan,                    'reservation_approval_method = ?', params[:approval_method_key]  ],
                      [:purpose_key,         {basic_info: [:purpose]}, "#{params[:purpose_key]} = ?",     1                             ]
                     ]
    parameter_keys.each do |parameter_key|
      unless params[parameter_key[0]].blank?
        @spaces = @spaces.joins(parameter_key[1]).where(parameter_key[2], parameter_key[3]).page(params[:page]).per(20)
        instance_variable_set("@exit_#{ parameter_key[0].to_s }", params[parameter_key[0]])
      end
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
