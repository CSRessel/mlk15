class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :artist, null: false
      t.text :blurb

      t.timestamps
    end
  end
end
