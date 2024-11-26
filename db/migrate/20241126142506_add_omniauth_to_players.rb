class AddOmniauthToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :uid, :string
    add_column :players, :token, :string
    add_column :players, :refresh_token, :string
  end
end
