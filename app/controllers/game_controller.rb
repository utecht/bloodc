class GameController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def player
    @player = Player.find(session[:player_id])
    @game = @player.game
  end
end
