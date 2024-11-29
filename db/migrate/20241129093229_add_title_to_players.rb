class AddTitleToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :title, :string
  end
end
