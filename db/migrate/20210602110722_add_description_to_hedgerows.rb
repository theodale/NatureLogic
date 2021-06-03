class AddDescriptionToHedgerows < ActiveRecord::Migration[6.0]
  def change
    add_column :hedgerows, :description, :string
  end
end
