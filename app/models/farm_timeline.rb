class FarmTimeline < ApplicationRecord
    has_many :farms
    has_one :farm_user
    belongs_to :estate, optional: true
    belongs_to :farm_user, optional: true

    def free_years
        years = []
        initial_year = Farm.find(self.initial_farm_id).year
        6.times do |n|
            years << initial_year + n
            years << initial_year - n
        end
        self.farms.each do |farm|
            years.delete(farm.year)
        end
        return years.sort
    end

    def initial_farm
        return Farm.find(self.initial_farm_id)
    end

    def add(year, farm_id)
        @farm = Farm.find(farm_id)
        @new_farm = @farm.create_deep_copy
        @new_farm.update({year: year})
        return @new_farm
    end

end

