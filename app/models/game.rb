class Game < ApplicationRecord
  has_many :game_players, inverse_of: :game
  has_many :players, through: :game_players
  has_many :game_player_runs, through: :game_players
  has_many :runs, through: :game_player_runs
  has_many :comments, dependent: :destroy

  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }

  def check_and_update_status!
    if status == "pending" && players.size == nb_of_players
      update!(status: "ongoing", start_date: Date.today, end_date: Date.today + duration.days)
    end
  end

end
