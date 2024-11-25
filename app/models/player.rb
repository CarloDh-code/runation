class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :game_players
  has_many :runs


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
