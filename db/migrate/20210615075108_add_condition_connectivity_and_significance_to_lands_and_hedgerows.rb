class AddConditionConnectivityAndSignificanceToLandsAndHedgerows < ActiveRecord::Migration[6.0]
  def change
    add_column :lands, :habitat_condition, :string, default: ""
    add_column :lands, :ecological_connectivity, :string, default: ""
    add_column :lands, :strategic_significance, :string, default: ""
    add_column :hedgerows, :habitat_condition, :string, default: ""
    add_column :hedgerows, :ecological_connectivity, :string, default: ""
    add_column :hedgerows, :strategic_significance, :string, default: ""
  end
end
