class PagesController < ApplicationController

  def home
    if farm_user_signed_in?
      redirect_to farm_path(current_farm_user.farm)
    elsif estate_user_signed_in?
      redirect_to estate_path(current_estate_user.estate)
    end
  end

end
