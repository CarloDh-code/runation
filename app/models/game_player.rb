class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player


  has_many :game_player_runs
  has_many :runs, through: :game_player_runs
end
