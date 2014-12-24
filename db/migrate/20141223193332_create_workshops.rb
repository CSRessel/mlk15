class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title, null:false
      t.string :author
      t.text :blurb

      t.timestamps
    end
  end
end
