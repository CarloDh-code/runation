class GamePlayer < ApplicationRecord
  belongs_to :game, inverse_of: :game_players
  belongs_to :player


  has_many :game_player_runs
  has_many :runs, through: :game_player_runs

  after_create :check_game_status

  private

  def check_game_status
    game.check_and_update_status!
  end

  

end
