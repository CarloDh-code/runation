class Run < ApplicationRecord
  belongs_to :player
  has_many :game_player_runs
end
