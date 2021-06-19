module LandsHelper

    def rotation_practice_table_data land
        if land.rotation_practice == "No crop rotation."
            return "None"
        elsif land.rotation_practice == "Intercropping."
            return "Intercropping"
        elsif land.rotation_practice == "Crop rotation (less than 2 year cycles)."
            return "Rotation"
        else
            return "-"
        end
    end

    def tillage_method_table_data land
        if land.tillage_method == "No tillage."
            return "None"
        elsif land.tillage_method == "Reduced tillage."
            return "Reduced"
        elsif land.tillage_method == "Conventional tillage."
            return "Conventional"
        else
            return "-"
        end
    end

end


