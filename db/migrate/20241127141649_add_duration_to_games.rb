class AddDurationToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :duration, :integer
  end
end
