class SchemesSurvey < ApplicationRecord
  belongs_to :farm

  def participations
    total = 0
    attributes = self.attributes.except(
      'conservation_projects_number',
      'landscape_networks_number',
      'farm_id',
      'id',
      'created_at',
      'updated_at'
    )
    attributes.each do |_key, value|
      total += 1 if value
    end
    total + conservation_projects_number + landscape_networks_number
  end
end
