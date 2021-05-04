class AddEstateUserIdToFarmUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :farm_users, :estate_user, null: true
  end
end
