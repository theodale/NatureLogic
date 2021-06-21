class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.is_a? FarmUser
      farm_user_create_farm_path
    elsif resource.is_a? EstateUser
      new_estate_path
    end
  end
end
