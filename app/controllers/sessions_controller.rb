class SessionsController < Devise::SessionsController

    protected

    def after_sign_in_path_for(resource)
        if resource.is_a? EstateUser
            logger.debug "Estate User"
            return estate_path(resource.estate)
        elsif resource.is_a? FarmUser
            logger.debug "Farm User"
            @farm = Farm.find(resource.farm_timeline.initial_farm_id)
            return farm_path(@farm)
        end
    end

end
