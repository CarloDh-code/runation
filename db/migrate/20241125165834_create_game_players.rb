class CreateGamePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :game_players do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :ranking

      t.timestamps
    end
  end
end
