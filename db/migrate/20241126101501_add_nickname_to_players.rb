class AddNicknameToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :name, :string
    add_column :players, :nickname, :string
  end
end
