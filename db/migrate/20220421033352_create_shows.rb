class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :image
      t.time :time

      t.timestamps
    end
  end
end
