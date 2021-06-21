class PagesController < ApplicationController
  def home
    if farm_user_signed_in?
      redirect_to farm_path(current_farm_user.farm)
    elsif estate_user_signed_in?
      if current_estate_user.estate
        logger.debug "HERE"
        logger.debug "estate id"
        logger.debug current_estate_user.id
        redirect_to estate_performance_path(estate_id: current_estate_user.estate.id)
      end
    end
  end
end


#   estate_performance GET
#   /estates/:estate_id/performance(.:format)
#   estates#performance/