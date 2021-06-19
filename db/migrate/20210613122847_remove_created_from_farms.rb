class RemoveCreatedFromFarms < ActiveRecord::Migration[6.0]
  def change
    remove_column :farms, :created
  end
end
