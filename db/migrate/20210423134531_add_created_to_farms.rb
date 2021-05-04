class AddCreatedToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :created, :boolean, default: "false"
  end
end
