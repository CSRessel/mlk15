class AddSubtitleToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :subtitle, :string
  end
end
