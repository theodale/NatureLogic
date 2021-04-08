ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Land Types" do
          para "All the land types stored on the app."
          table_for LandType.all.each do |land_type|
            column "Category", :category
            column "Sequestration", :sequestration_per_ha
            column "Defra Score", :defra_uniqueness_score
            column "Area for Nature", :area_for_nature_rating
            column "Above Ground Carbon", :above_ground_carbon_per_ha
            column "Meta Category", :meta_category
          end
        end
      end

      column do
        panel "Hedgerow Types" do
          para "All the hedgerow types stored on the app."
          table_for HedgerowType.all.each do |land_type|
            column "Category", :category
            column "Sequestration", :sequestration_per_km
            column "Defra Score", :defra_uniqueness_score
            column "Area for Nature", :area_for_nature_rating
            column "Above Ground Carbon", :above_ground_carbon_per_km
          end
        end
      end

    end

  end
end