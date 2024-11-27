require 'fast_polylines'

class Run < ApplicationRecord
  belongs_to :player
  has_many :game_player_runs

    def decoded_path
      begin
      FastPolylines.decode(self.polyline)
      rescue StandardError => e
        Rails.logger.error("Failed to decode polyline: #{e.message}")
        nil
      end
    end
end
