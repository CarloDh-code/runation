module Strava
  class FetchActivities
    def initialize(player)
      @player = player
    end

    def call
      client = Strava::Api::Client.new(
        access_token: @player.token
      )

      activities = client.athlete_activities.select { |activity| activity.type == "Run" }


      activities.map do |activity|
        next if @player.runs.exists?(strava_activity_id: activity.id)

        @player.runs.create!(
          strava_activity_id: activity.id,
          start_lat: activity.start_latlng[0],
          start_long: activity.start_latlng[1],
          end_lat: activity.end_latlng[0],
          end_long: activity.end_latlng[1],
          start_datetime: activity.start_date,
          end_datetime: activity.start_date + activity.moving_time,
          polyline: activity.map.summary_polyline,
          player_id: @player.id,
          name: activity.name
        )
      end.compact
    end
  end
end
