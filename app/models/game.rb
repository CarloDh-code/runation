class Game < ApplicationRecord
  has_many :game_players, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }
end
