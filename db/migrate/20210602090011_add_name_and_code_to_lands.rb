class AddNameAndCodeToLands < ActiveRecord::Migration[6.0]
  def change
    add_column :lands, :name, :string
    add_column :lands, :code, :string
  end
end
