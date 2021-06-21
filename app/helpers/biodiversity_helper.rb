module BiodiversityHelper
  def habitat_condition_table_data(habitat)
    if habitat.habitat_condition == 'Good.'
      'Good'
    elsif habitat.habitat_condition == 'Moderate.'
      'Moderate'
    elsif habitat.habitat_condition == 'Poor.'
      'Poor'
    else
      'N/A'
    end
  end

  def ecological_connectivity_table_data(habitat)
    if habitat.ecological_connectivity == 'Highly connected habitat.'
      'High'
    elsif habitat.ecological_connectivity == 'Moderately connected habitat.'
      'Moderate'
    elsif habitat.ecological_connectivity == 'Unconnected habitat.'
      'Unconnected'
    else
      '-'
    end
  end

  def strategic_significance_table_data(habitat)
    if habitat.strategic_significance == 'Within local strategy area.'
      'Significant'
    elsif habitat.strategic_significance == 'Ecologically desirable area but not within local strategy area.'
      'Desirable'
    else
      'None'
    end
  end
end
