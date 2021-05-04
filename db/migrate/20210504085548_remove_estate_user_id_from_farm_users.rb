class RemoveEstateUserIdFromFarmUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :farm_users, :estate_user_id
  end
end
