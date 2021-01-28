module FarmsHelper

    def add_lands(f)
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

    def add_hedgerows(f)
        new_hedgerow = Hedgerow.new
        id = new_hedgerow.object_id
        fields = f.fields_for(:hedgerows, new_hedgerow, child_index: id) do |builder|
            render("hedgerow_fields", f: builder)
        end
        link_to("Add New Hedgerow", '#', class: "add_land btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
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
            "Agriculture Products": (@farm.agriculture_products_spend*2.144).round(1),
            "Wood and Wood Products": (@farm.wood_and_wood_products_spend*0.64).round(1),
            "Pesticides": (@farm.pesticides_spend*0.776).round(1),
            "Machinery and Equipment": (@farm.machinery_and_equipment_spend*0.56).round(1),
            "Enteric Emissions": (@farm.number_of_sheep*1003.75 + @farm.number_of_cows*4015).round(1)
        }
    end

    def offset_revenue
        (60 * @farm.net_emissions / 1000).round(2)
    end

end
