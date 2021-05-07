class SessionsController < Devise::SessionsController

    protected

    def after_sign_in_path_for(resource)
        case resource.class
        when EstateUser.class
            estate_path(resource.estate)
        when FarmUser.class
            farm_path(resource.farm)
        end
    end

end
