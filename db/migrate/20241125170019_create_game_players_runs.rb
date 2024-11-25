class CreateGamePlayersRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :game_players_runs do |t|
      t.references :game_player, null: false, foreign_key: true
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
