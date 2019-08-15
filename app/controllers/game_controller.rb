class GameController < ApplicationController
  def show
    @game = Game.find(session[:game_id])
    @roles = Role.where(edition: @game.edition)
  end

  def player
    @player = Player.find(session[:player_id])
    @game = @player.game
    @roles = Role.where(edition: @game.edition)
  end

  def lock
    @game = Game.find(session[:game_id])
    @game.phase = 'assignment'
    @game.save
    redirect_to @game
  end

  def start
    @game = Game.find(session[:game_id])
    @game.phase = 'active'
    @game.save
    redirect_to @game
  end

  def assign
    @player = Player.find(params[:id])
    role = Role.find(params[:player][:role])
    @player.role = role
    respond_to do |format|
      if @player.save
        @roles = Role.where(edition: @player.game.edition)
        format.js
      else
        return redirect_to '/game', alert: "Role not assigned."
      end
    end
  end

  def update
    player = Player.find(params[:id])
    role = Role.find(params[:player][:role])
    player.role = role
    player.save
  end
end
