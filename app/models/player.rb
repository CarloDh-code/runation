class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :game_players
  has_many :games, through: :game_players
  has_many :runs
  has_one_attached :photo


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def surface_covered_in_km2
  # Calculer la surface totale couverte par le joueur en degrés carrés, en excluant les valeurs nil
  total_surface_in_degrees = self.game_players.sum { |game_player| game_player.score.to_i }
  # Si la surface totale est nulle, retourner 0
  return 0 if total_surface_in_degrees == 0
  # Conversion en km² en multipliant par 8547
  total_surface_in_km2 = total_surface_in_degrees * 8547
  # Arrondir à l'entier le plus proche (sans décimales)
  total_surface_in_km2.to_i
end


  def self.total_runs(player_id)
    # Compter le nombre de runs associés à ce joueur à travers la table GamePlayerRuns
    GamePlayerRun.joins(:game_player)
                 .where(game_players: { player_id: player_id })
                 .count
  end
end
