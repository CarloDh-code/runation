class ChangeDurationDefaultInGames < ActiveRecord::Migration[7.1]
  def change
    change_column_default :games, :duration, 10
  end
end
