class CommentsController < ApplicationController
  def chat
    @game = Game.find(params[:game_id])
    unless @game.status == "ongoing"
      redirect_to game_path(@game), alert: "Chat is only available for ongoing games."
      return
    end

    @comments = @game.comments.includes(:player)
  end

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.new(comment_params)
    @comment.player = current_player

    if @comment.save
      respond_to do |format|
        format.html { redirect_to chat_game_comments_path(@game) } # Redirige en cas d'une requête classique
        format.turbo_stream # Répond à Turbo Stream pour mise à jour dynamique
      end
    else
      @comments = @game.comments.includes(:player)
      respond_to do |format|
        format.html { render :chat, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('form-errors', partial: 'comments/errors', locals: { comment: @comment }) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
