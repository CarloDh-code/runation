class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :map_polyline
      t.integer :nb_of_players
      t.date :start_date
      t.date :end_date
      t.string :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
