class CreateHedgerows < ActiveRecord::Migration[6.0]
  def change
    create_table :hedgerows do |t|
      t.decimal :length
      t.belongs_to :farm
      t.belongs_to :hedgerow_type
      t.timestamps
    end
  end
end
