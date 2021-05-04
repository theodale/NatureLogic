class SchemesSurvey < ApplicationRecord
    belongs_to :farm

    def participations
        total = 0
        attributes = self.attributes.except(
            "conservation_projects_number",
            "landscape_networks_number",
            "farm_id",
            "id",
            "created_at",
            "updated_at"
        )
        attributes.each do |key, value|
            if value
                total += 1
            end
        end
        total + self.conservation_projects_number + self.landscape_networks_number
    end

end
