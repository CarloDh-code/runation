class Game < ApplicationRecord
  has_many :game_players
  has_many :game_player_runs, through: :game_players
  has_many :runs, through: :game_player_runs
  has_many :comments, dependent: :destroy
  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }
end
