class GamePlayer < ApplicationRecord
  belongs_to :game, inverse_of: :game_players
  belongs_to :player


  has_many :game_player_runs
  has_many :runs, through: :game_player_runs
  has_many :notifications, through: :players

  after_create :check_game_status


  def update_ranking
    
  end

  private

  def notification_message
    if @current_player.game.include?
      Notification.create!(
        player: game_player_run.player,
        content: "Vous avez été ajouté à la partie '#{game.name}' par #{game_player.player_id}"
      )
    end
    Notification.save
  end

  def check_game_status
    game.check_and_update_status!
  end

  def check_and_update_status!
    if status == "pending" && players.size == nb_of_players
      update!(status: "ongoing", start_date: Date.today, end_date: Date.today + duration.days)
    end
  end
end
