module FarmsHelper

    def add_lands(f)
        new_land = Land.new
        id = new_land.object_id
        # pass record_name and record_object into fields for -
        # this specifies respectively how input named in params hash and what values the new input's object originally has
        # fields for assigns an id to each set of fields it creates - these are the id's in land_attributes in the params hash
        fields = f.fields_for(:lands, new_land, child_index: id) do |builder|
            render("layouts/land_fields", f: builder)
        end
        link_to("Add New Land", '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

end

# may need to change from lands to lands