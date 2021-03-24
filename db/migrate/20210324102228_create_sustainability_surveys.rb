class CreateSustainabilitySurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :sustainability_surveys do |t|

      t.timestamps
    end
  end
end
