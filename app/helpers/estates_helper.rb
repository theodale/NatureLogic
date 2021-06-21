module EstatesHelper
  def emissions_bar_chart_data
    [
      ['Emissions', @estate.get_total(:total_emissions)],
      ['Sequestration', @estate.get_total(:total_sequestration)],
      ['Net', @estate.get_total(:net_emissions)]
    ]
  end

  def energy_usage
    total_usage =
      @estate.get_total(:total_electricity_use) * 0.23314 +
      @estate.get_total(:total_diesel_use) * 2.6870514 +
      @estate.get_total(:total_gas_use) * 0.18387
    total_usage.round(0)
  end

  def energy_pie_chart_data
    [
      ['Electricity', (@estate.get_total(:total_electricity_use) * 0.23314).round(0)],
      ['Diesel', (@estate.get_total(:total_diesel_use) * 2.6870514).round(0)],
      ['Gas', (@estate.get_total(:total_gas_use) * 0.18387).round(0)]
    ]
  end

  def habitat_pie_chart_data
    data = {}
    @estate.farm_timelines.each do |farm_timeline|
      @farm = Farm.find(farm_timeline.initial_farm_id)
      @farm.lands.each do |land|
        if data[land.land_type.meta_category]
          data[land.land_type.meta_category] += land.area
        else
          data[land.land_type.meta_category] = land.area
        end
      end
    end
    data
  end
end
