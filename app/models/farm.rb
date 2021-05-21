class Farm < ApplicationRecord
    belongs_to :farm_timeline
    has_many :lands, dependent: :destroy
    has_many :hedgerows, dependent: :destroy
    has_one :target, dependent: :destroy
    has_one :biodiversity_survey, dependent: :destroy
    has_one :sustainability_survey, dependent: :destroy
    has_one :schemes_survey, dependent: :destroy
    has_one :countryside_stewardship_survey, dependent: :destroy
    has_one :lab_based_soil_test, dependent: :destroy
    has_one :in_field_soil_test, dependent: :destroy

    def create_deep_copy
        @copy = self.dup
        @copy.created = false
        self.lands.each do |land|
            @copied_land = land.dup
            @copied_land.save
            @copy.lands << @copied_land
        end
        self.hedgerows.each do |hedgerow|
            @copied_hedgerow = hedgerow.dup
            @copied_hedgerow.save
            @copy.hedgerows << @copied_hedgerow
        end
        @copied_target = self.target.dup
        @copied_target.save
        @copy.target = @copied_target
        @copied_biodiversity_survey = self.biodiversity_survey.dup
        @copied_biodiversity_survey.save
        @copy.biodiversity_survey = @copied_biodiversity_survey
        @copied_sustainability_survey = self.sustainability_survey.dup
        @copied_sustainability_survey.save
        @copy.sustainability_survey = @copied_sustainability_survey
        @copied_schemes_survey = self.schemes_survey.dup
        @copied_schemes_survey.save
        @copy.schemes_survey = @copied_schemes_survey
        @copied_countryside_stewardship_survey = self.countryside_stewardship_survey.dup
        @copied_countryside_stewardship_survey.save
        @copy.countryside_stewardship_survey = @copied_countryside_stewardship_survey
        @copied_in_field_soil_test = self.in_field_soil_test.dup
        self.in_field_soil_test.soil_samples.each do |soil_sample|
            @copied_soil_sample = soil_sample.dup
            @copied_soil_sample.save
            @copied_in_field_soil_test.soil_samples << @copied_soil_sample
        end
        @copied_in_field_soil_test.save
        @copy.in_field_soil_test = @copied_in_field_soil_test
        @copied_lab_based_soil_test = self.lab_based_soil_test.dup
        self.lab_based_soil_test.soil_parcels.each do |soil_parcel|
            @copied_soil_parcel = soil_parcel.dup
            @copied_soil_parcel.save
            @copied_lab_based_soil_test.soil_parcels << @copied_soil_parcel
        end
        @copied_lab_based_soil_test.save
        @copy.lab_based_soil_test = @copied_lab_based_soil_test
        @copy.save
        return @copy
    end

    def create_associations
        self.create_in_field_soil_test
        self.create_lab_based_soil_test
        self.create_countryside_stewardship_survey
        self.create_schemes_survey
        self.create_sustainability_survey
        self.create_target
        self.create_biodiversity_survey
    end

    # Carbon

    def scope_one
        emissions = self.total_diesel_use*0.25278 + self.total_gas_use*0.18387
        return emissions.round(0)
    end

    def scope_two
        emissions = self.total_electricity_use*0.23314
        return emissions.round(0)
    end

    def scope_three
        emissions = self.artificial_fertiliser_use*3.6 +
        self.agriculture_products_spend*2.144 +
        self.wood_and_wood_products_spend*0.64 +
        self.pesticides_spend*0.776 +
        self.machinery_and_equipment_spend*0.56 +
        self.number_of_sheep*1003.75 +
        self.number_of_cows*4015
        return emissions.round(0)
    end

    def total_emissions
        return scope_one + scope_two + scope_three
    end

    # Land and hedgerow sequestration
    def annual_sequestration
        total = 0
        self.lands.each do |land|
            total -= land.sequestration
        end
        self.hedgerows.each do |hedgerow|
            total -= hedgerow.sequestration
        end
        return total.round(0)
    end

    # Lab-based soil test sequestration
    def farmland_sequestration
        if self.lab_based_soil_test
            total = self.lab_based_soil_test.total_carbon_in_terms_of_CO2e_last_year -
                self.lab_based_soil_test.total_carbon_in_terms_of_CO2e
        else
            total = 0
        end
        return total.round(0)
    end

    def total_sequestration
        return annual_sequestration + farmland_sequestration
    end

    def net_emissions
        return (total_emissions + annual_sequestration + farmland_sequestration).round(0)
    end

    def potential_revenue_from_offset
        (net_emissions * 0.06).round(2)
    end

    def above_ground_carbon
        total = 0
        self.lands.each do |land|
            total += land.area * land.land_type.above_ground_carbon_per_ha
        end
        self.hedgerows.each do |hedgerow|
            total += hedgerow.length * hedgerow.hedgerow_type.above_ground_carbon_per_km
        end
        return total.round(0)
    end

    def sequestration_by_meta_category
        sequestrations = {}
        self.lands.each do |land|
            if sequestrations[land.land_type.meta_category]
                sequestrations[land.land_type.meta_category] += land.sequestration
            else
                sequestrations[land.land_type.meta_category] = land.sequestration
            end
        end
        self.hedgerows.each do |hedgerow|
            sequestrations[hedgerow.hedgerow_type.category] = hedgerow.sequestration
        end
        return sequestrations
    end

    # Nature

    def defra_habitat_score
        total = 0
        self.lands.each do |land|
            total += (land.land_type.defra_uniqueness_score * land.area / 10)
        end
        self.hedgerows.each do |hedgerow|
            total += hedgerow.hedgerow_type.defra_uniqueness_score * hedgerow.length
        end
        if self.total_area != 0
            return  (total / total_area).round(1)

        else
            return 0
        end
    end

    def space_for_nature_score
        total_space_for_nature_index = 0
        self.lands.each do |land|
            spray_factor = land.sprayed ? 0.2 : 1
            total_space_for_nature_index += spray_factor * land.area * land.land_type.area_for_nature_rating
        end
        if self.total_area != 0
            return (total_space_for_nature_index / (self.total_area * 10)).round(1)
        else
            return 0
        end
    end

    def tree_covered_area
        area = 0
        self.lands.each do |land|
            if land.land_type.meta_category == "Woodland and forest"
                area += land.area
            end
        end
        return area
    end

    def scrubland_area
        area = 0
        self.lands.each do |land|
            if land.land_type.meta_category == "Heathland & Scrub"
                area += land.area
            end
        end
        return area
    end

    def nature_positive_area
        area = self.biodiversity_survey.area_of_grass_wildflower_scrub_not_for_production +
            self.biodiversity_survey.area_designated_for_natural_conservation +
            tree_covered_area +
            scrubland_area
        return area
    end

    # Utilities

    def length_of_hedgerows
        length = 0
        self.hedgerows.each do |hedgerow|
            length += hedgerow.length
        end
        return length
    end

    def total_area
        area = 0
        self.lands.each do |land|
            area += land.area
        end
        return area
    end

end


