class ChangeStravaIdForRuns < ActiveRecord::Migration[7.1]
  def change
    change_column :runs, :strava_activity_id, :bigint
  end
end
