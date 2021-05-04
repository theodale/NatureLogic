module FarmCreationHelper

    def farm_and_estate_ids
        {
            estate_id: params[:estate_id],
            farm_id: params[:farm_id]
        }
    end

end
