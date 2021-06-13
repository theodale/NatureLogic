class AddEstateIdToTargets < ActiveRecord::Migration[6.0]
  def change
    add_reference :targets, :estate, null: true
    remove_belongs_to :targets, :farm
    add_reference :targets, :farm, null: true
  end
end
