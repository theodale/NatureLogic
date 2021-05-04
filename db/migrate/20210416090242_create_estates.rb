class CreateEstates < ActiveRecord::Migration[6.0]
  def change
    create_table :estates do |t|
      t.belongs_to :estate_user
      t.timestamps
    end
  end
end
