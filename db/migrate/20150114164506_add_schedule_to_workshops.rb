class AddScheduleToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :schedule, :string
  end
end
