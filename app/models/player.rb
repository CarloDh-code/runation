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
end
