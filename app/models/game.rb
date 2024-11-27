class Game < ApplicationRecord

  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players
  has_many :comments, dependent: :destroy
  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }



  def decoded_path_game
    begin
    FastPolylines.decode(self.map_polyline)
    rescue StandardError => e
      Rails.logger.error("Failed to decode polyline: #{e.message}")
      nil
    end
  end
end
