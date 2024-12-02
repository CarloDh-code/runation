class AddScoreToGamePlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :game_players, :score, :float
  end
end
