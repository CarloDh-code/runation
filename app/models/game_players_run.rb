class GamePlayersRun < ApplicationRecord
  belongs_to :game_player
  belongs_to :run
end
