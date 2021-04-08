module FarmsHelper

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
