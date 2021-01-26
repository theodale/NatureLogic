ActiveAdmin.register LandType do

  permit_params :category, :sequestration_per_ha, :defra_uniqueness_score, :area_for_nature_rating, :above_ground_carbon_per_ha

end
