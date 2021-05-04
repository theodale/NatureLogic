class AddFarmUserToFarms < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :farm_user, null: true
  end
end
