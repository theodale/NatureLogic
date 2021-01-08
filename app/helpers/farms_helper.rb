module FarmsHelper

    def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new # create a new associated object
        id = new_object.object_id # save id of associated object
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render("layouts/" + association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

end
