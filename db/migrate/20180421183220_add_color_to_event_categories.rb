class AddColorToEventCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :event_categories, :color, :string, default: "000000"
    add_column :event_categories, :icon, :string, default: "fas fa-circle"
  end
end
