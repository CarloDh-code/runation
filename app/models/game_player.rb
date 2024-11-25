class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player

  has_many :game_players_runs
end
