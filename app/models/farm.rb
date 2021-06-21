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
    @copy = dup
    @copy.created = false
    lands.each do |land|
      @copied_land = land.dup
      @copied_land.save
      @copy.lands << @copied_land
    end
    hedgerows.each do |hedgerow|
      @copied_hedgerow = hedgerow.dup
      @copied_hedgerow.save
      @copy.hedgerows << @copied_hedgerow
    end
    @copied_target = target.dup
    @copied_target.save
    @copy.target = @copied_target
    @copied_biodiversity_survey = biodiversity_survey.dup
    @copied_biodiversity_survey.save
    @copy.biodiversity_survey = @copied_biodiversity_survey
    @copied_sustainability_survey = sustainability_survey.dup
    @copied_sustainability_survey.save
    @copy.sustainability_survey = @copied_sustainability_survey
    @copied_schemes_survey = schemes_survey.dup
    @copied_schemes_survey.save
    @copy.schemes_survey = @copied_schemes_survey
    @copied_countryside_stewardship_survey = countryside_stewardship_survey.dup
    @copied_countryside_stewardship_survey.save
    @copy.countryside_stewardship_survey = @copied_countryside_stewardship_survey
    @copied_in_field_soil_test = in_field_soil_test.dup
    in_field_soil_test.soil_samples.each do |soil_sample|
      @copied_soil_sample = soil_sample.dup
      @copied_soil_sample.save
      @copied_in_field_soil_test.soil_samples << @copied_soil_sample
    end
    @copied_in_field_soil_test.save
    @copy.in_field_soil_test = @copied_in_field_soil_test
    @copied_lab_based_soil_test = lab_based_soil_test.dup
    lab_based_soil_test.soil_parcels.each do |soil_parcel|
      @copied_soil_parcel = soil_parcel.dup
      @copied_soil_parcel.save
      @copied_lab_based_soil_test.soil_parcels << @copied_soil_parcel
    end
    @copied_lab_based_soil_test.save
    @copy.lab_based_soil_test = @copied_lab_based_soil_test
    @copy.save
    @copy
  end

  def create_associations
    create_in_field_soil_test
    create_lab_based_soil_test
    create_schemes_survey
    create_sustainability_survey
    create_biodiversity_survey
    if !target
      create_target
    end
  end

  # Carbon

  def scope_one
    emissions = total_diesel_use * 0.25278 + total_gas_use * 0.18387
    emissions.round(0)
  end

  def scope_two
    emissions = total_electricity_use * 0.23314
    emissions.round(0)
  end

  def scope_three
    emissions = artificial_fertiliser_use * 3.6 +
                agriculture_products_spend * 2.144 +
                wood_and_wood_products_spend * 0.64 +
                pesticides_spend * 0.776 +
                machinery_and_equipment_spend * 0.56 +
                number_of_sheep * 1003.75 +
                number_of_cows * 4015
    emissions.round(0)
  end

  def total_emissions
    scope_one + scope_two + scope_three
  end

  def total_energy_usage
    usage = total_electricity_use * 0.23314 +
            total_diesel_use * 2.6870514 +
            total_gas_use * 0.18387
    usage.round(0)
  end

  def sequestration
    total = 0
    lands.each do |land|
      total -= land.sequestration
    end
    hedgerows.each do |hedgerow|
      total -= hedgerow.sequestration
    end
    total
  end

  def net_emissions
    total_emissions + sequestration
  end

  def offset_revenue
    -1 * net_emissions * farm_timeline.estate.carbon_price
  end

  def above_ground_carbon
    total = 0
    lands.each do |land|
      total += land.area * land.land_type.above_ground_carbon_per_ha
    end
    hedgerows.each do |hedgerow|
      total += hedgerow.length * hedgerow.hedgerow_type.above_ground_carbon_per_km
    end
    total
  end

  def sequestration_by_meta_category
    sequestrations = {}
    lands.each do |land|
      if sequestrations[land.land_type.meta_category]
        sequestrations[land.land_type.meta_category] += land.sequestration
      else
        sequestrations[land.land_type.meta_category] = land.sequestration
      end
    end
    hedgerows.each do |hedgerow|
      sequestrations[hedgerow.hedgerow_type.category] = hedgerow.sequestration
    end
    sequestrations
  end

  # Nature

  def defra_habitat_score
    total = 0
    lands.each do |land|
      total += (land.land_type.defra_uniqueness_score * land.area / 10)
    end
    hedgerows.each do |hedgerow|
      total += hedgerow.hedgerow_type.defra_uniqueness_score * hedgerow.length
    end
    if total_area != 0
      (total / total_area).round(1)
    else
      0
    end
  end

  def biodiversity_units_per_hectare_percentage
    if total_area == 0
      0
    else
      total_units = 0
      lands.each do |land|
        total_units += land.biodiversity_units
      end
      percentage = (total_units * 100) / (total_area * 23.805)
      percentage.round(0)
    end
  end

  def space_for_nature_score
    total_space_for_nature_index = 0
    lands.each do |land|
      spray_factor = land.sprayed ? 0.2 : 1
      total_space_for_nature_index += spray_factor *
                                      land.area * land.land_type.area_for_nature_rating
    end
    if total_area != 0
      (total_space_for_nature_index / (total_area * 10)).round(1)
    else
      0
    end
  end

  # Features and coverage

  def area_of(type)
    if total_area == 0
      0
    else
      area = 0
      lands.each do |land|
        area += land.area if land.land_type.meta_category == type
      end
      area
    end
  end

  def ecological_focus_area_percentage
    if total_area == 0
      0
    else
      focus_area = biodiversity_survey.area_of_grass_wildflower_scrub_not_for_production +
                   area_of('Woodland') +
                   area_of('Heathland & Scrub') +
                   biodiversity_survey.area_designated_for_natural_conservation
      (focus_area * 100 / total_area).round(1)
    end
  end

  def tree_coverage_percentage
    if total_area == 0
      0
    else
      (100 * area_of('Woodland') / total_area).round(1)
    end
  end

  def nature_positive_area
    biodiversity_survey.area_of_grass_wildflower_scrub_not_for_production +
      biodiversity_survey.area_designated_for_natural_conservation +
      tree_covered_area +
      scrubland_area
  end

  def length_of_hedgerows
    length = 0
    hedgerows.each do |hedgerow|
      length += hedgerow.length
    end
    length
  end

  def total_area
    area = 0
    lands.each do |land|
      area += land.area
    end
    area
  end

  # Strategy

  def perform_interventions(interventions)
    # update applied_interventions
    applied_interventions = interventions[:applied_interventions] || {}
    applied_interventions[:land_area_changes] = {} unless applied_interventions[:land_area_changes]
    applied_interventions[:new_lands] = {} unless applied_interventions[:new_lands]
    if interventions[:woodland_conversion]
      target_land_id = interventions[:woodland_conversion][:target_land_id].to_s
      woodland_type_id = interventions[:woodland_conversion][:woodland_type_id].to_s
      if applied_interventions[:land_area_changes][target_land_id]
        applied_interventions[:land_area_changes][target_land_id] =
          applied_interventions[:land_area_changes][target_land_id].to_i - 1
      else
        applied_interventions[:land_area_changes][target_land_id] = -1
      end
      if applied_interventions[:new_lands][woodland_type_id]
        applied_interventions[:new_lands][woodland_type_id] =
          applied_interventions[:new_lands][woodland_type_id].to_i + 1
      else
        applied_interventions[:new_lands][woodland_type_id] = 1
      end
    end
    if interventions[:hedgerow_conversion]
      target_land_id = interventions[:hedgerow_conversion][:target_land_id].to_s
      if applied_interventions[:land_area_changes][target_land_id]
        applied_interventions[:land_area_changes][target_land_id] =
          applied_interventions[:land_area_changes][target_land_id].to_f - 0.002
      else
        applied_interventions[:land_area_changes][target_land_id] = -0.002
      end
      applied_interventions[:hedgerow_increase] =
        applied_interventions[:hedgerow_increase].to_i + 1
    end
    if interventions[:diesel_reduction]
      if applied_interventions[:diesel_reduction]
        if applied_interventions[:diesel_reduction].to_i < 5
          applied_interventions[:diesel_reduction] =
            applied_interventions[:diesel_reduction].to_i + 1
        end
      else
        applied_interventions[:diesel_reduction] = 1
      end
    end
    if interventions[:fertiliser_reduction]
      if applied_interventions[:fertiliser_reduction]
        if applied_interventions[:fertiliser_reduction].to_i < 5
          applied_interventions[:fertiliser_reduction] =
            applied_interventions[:fertiliser_reduction].to_i + 1
        end
      else
        applied_interventions[:fertiliser_reduction] = 1
      end
    end
    if interventions[:green_energy_tariff]
      if interventions[:green_energy_tariff] == 'true'
        applied_interventions[:green_energy_tariff] = interventions[:green_energy_tariff]
      elsif interventions[:green_energy_tariff] == 'false'
        applied_interventions.delete(:green_energy_tariff)
      end
    end
    if interventions[:increase_soc]
      if interventions[:increase_soc] == 'true'
        applied_interventions[:increase_soc] = interventions[:increase_soc]
      elsif interventions[:increase_soc] == 'false'
        applied_interventions.delete(:increase_soc)
      end
    end
    # perform interventions
    applied_interventions[:land_area_changes].each do |key, value|
      lands.each do |land|
        land.area = land.area + value.to_i if land.id == key.to_i
      end
    end
    applied_interventions[:new_lands].each do |key, value|
      lands.build({
                    farm_id: id,
                    land_type_id: key.to_i,
                    area: value
                  })
    end
    if applied_interventions[:hedgerow_conversion]
      hedgerows.build({
                        farm_id: id,
                        hedgerow_type_id: 14,
                        length: applied_interventions[:hedgerow_conversion]
                      })
    end
    if applied_interventions[:diesel_reduction]
      self.total_diesel_use = total_diesel_use *
                              (1 - (0.2 * applied_interventions[:diesel_reduction].to_i))
    end
    if applied_interventions[:fertiliser_reduction]
      self.artificial_fertiliser_use = artificial_fertiliser_use *
                                       (1 - (0.2 * applied_interventions[:artificial_fertiliser_use].to_i))
    end
    self.total_electricity_use = 0 if applied_interventions[:green_energy_tariff]
    lab_based_soil_test.increased = true if applied_interventions[:increase_soc]
    applied_interventions
  end
end
