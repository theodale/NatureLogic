class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a? EstateUser
      # the guy hasnt got an estate, where do we create them?
      if current_estate_user.estate
        estate_path(current_estate_user.estate.id)
      else
        new_estate_path
      end
    elsif resource.is_a? FarmUser
      @farm = Farm.find(resource.farm_timeline.initial_farm_id)
      farm_path(@farm.id)
    end
  end
end
