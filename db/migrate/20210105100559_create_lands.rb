class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.decimal :area
      t.timestamps
    end
  end
end
