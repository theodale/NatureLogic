class ApplicationController < ActionController::Base
    before_action :get_user

    def get_user
        @farm_user = current_farm_user
        @estate_user = current_estate_user
    end
end
