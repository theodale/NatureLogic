module FarmsHelper

    def link_to_add_lands(f)
        new_land = Land.new
        id = new_land.object_id
        # pass record_name and record_object into fields for
        # this specifies respectively how input named in params hash and what values the new input's object originally has
        # fields for assigns an id to each set of fields it creates - these are the id's in land_attributes in the params hash
        fields = f.fields_for(:lands, new_land, child_index: id) do |builder|
            render("land_fields", f: builder)
        end
        link_to("Add New Land", '#', class: "add_land btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def target_achieved(target, result)
        if result > target
            ('<i class="fas fa-check-circle fa-lg success"></i>').html_safe
        else
            ('<i class="fas fa-times-circle target-card-icon fa-lg fail">').html_safe
        end
    end

    def scope_three_hash
        {
            "Agriculture Products": (@intervention_farm.agriculture_products_spend*2.144).round(1),
            "Wood and Wood Products": (@intervention_farm.wood_and_wood_products_spend*0.64).round(1),
            "Pesticides": (@intervention_farm.pesticides_spend*0.776).round(1),
            "Machinery and Equipment": (@intervention_farm.machinery_and_equipment_spend*0.56).round(1),
            "Enteric Emissions": (@intervention_farm.number_of_sheep*1003.75 + @intervention_farm.number_of_cows*4015).round(1)
        }
    end

    def offset_revenue
        (60 * @intervention_farm.net_emissions / 1000).round(2)
    end

    def reset_params(request_params)
        if request_params[:to_woodland]
            request_params.delete(:to_woodland)
        end
        if request_params[:reduce_usage]
            request_params.delete(:reduce_usage)
        end
        if request_params[:go_organic]
            request_params.delete(:go_organic)
        end
        request_params[:id] = @intervention_farm.id
        request_params
    end

end

