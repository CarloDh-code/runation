class RenameGamePlayerRuns < ActiveRecord::Migration[7.1]
  def change
    rename_table :game_players_runs, :game_player_runs
  end
end
