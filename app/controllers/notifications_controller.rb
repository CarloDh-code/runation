class NotificationsController < ApplicationController
  before_action :authenticate_player! # Assure que le joueur est connecté

  def index
    @notifications = current_player.notifications.order(created_at: :desc)
  end

  def mark_as_read
    notification = current_player.notifications.find(params[:id])
    notification.update(read: true)
    redirect_to notification.link
  end

  def clear_all
    current_player.notifications.update_all(read: true)
    redirect_to notifications_path, notice: 'Toutes les notifications ont été marquées comme lues.'
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_path, notice: 'Notification supprimée.' }
      format.js   # Pour les requêtes AJAX, vous pouvez répondre avec un fichier JS
    end
  end
end
