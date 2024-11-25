class CreateRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :runs do |t|
      t.date :start_date
      t.date :end_date
      t.float :start_lat
      t.float :end_lat
      t.float :start_long
      t.float :end_long
      t.text :polyline
      t.integer :strava_activity_id
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
