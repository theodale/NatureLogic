class FarmTimeline < ApplicationRecord
  has_many :farms
  belongs_to :estate, optional: true
  belongs_to :farm_user, optional: true

  def free_years
    years = []
    initial_year = Farm.find(initial_farm_id).year
    6.times do |n|
      years << initial_year + n
      years << initial_year - n
    end
    farms.each do |farm|
      years.delete(farm.year)
    end
    years.sort
  end

  def present_farm
    current_year = Time.now.year
    Farm.find_by(year: current_year)
  end

  def add(year, farm_id)
    @farm = Farm.find(farm_id)
    @new_farm = @farm.create_deep_copy
    @new_farm.update({ year: year })
    @new_farm
  end

  def destroy_farms
    farms.each do |farm|
      farm.destroy
    end
  end
end
