class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.timestamps
      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
    end
  end
end
