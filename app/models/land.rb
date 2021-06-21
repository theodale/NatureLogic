class Land < ApplicationRecord
  belongs_to :farm
  belongs_to :land_type

  def change_area(a)
    self.area = a
  end

  def biodiversity_units
    habitat_condition_multiplier = if habitat_condition == 'Good.'
                                     3
                                   elsif habitat_condition == 'Moderate.'
                                     2
                                   else
                                     1
                                   end
    ecological_connectivity_multiplier = if ecological_connectivity == 'Highly connected habitat.'
                                           1.15
                                         elsif ecological_connectivity == 'Moderately connected habitat.'
                                           1.1
                                         else
                                           1
                                         end
    if strategic_significance == 'Within local strategy area.'
      strategic_significance_multiplier = 1.15
    elsif strategic_significance == 'Ecologically desirable area but not within local strategy area.'
      strategic_significance_multiplier = 1.1
    else
      strategic_significance_multiplier = 1
    end
    area * land_type.defra_uniqueness_score * habitat_condition_multiplier *
      ecological_connectivity_multiplier * strategic_significance_multiplier
  end



  def sequestration
    if tillage_method == 'Conventional tillage.'
      tillage_score = 0.01
    elsif tillage_method == 'Reduced tillage.'
      tillage_score = 0.03
    else
      tillage_score = 1
    end
    (area * land_type.sequestration_per_ha * tillage_score)
  end

  def type
    land_type.category
  end
end
