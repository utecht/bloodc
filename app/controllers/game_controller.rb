class GameController < ApplicationController
  def show
    if cookies.encrypted[:game_id].nil?
      return redirect_to '/player'
    end
    unless @game = Game.find(cookies.encrypted[:game_id])
      return redirect_to '/', alert: "Your game not found"
    end
    @roles = Role.where(edition: @game.edition)
  end

  def all_roles
    if cookies.encrypted[:game_id].nil?
      return redirect_to '/', alert: "Wrong place"
    end
    unless @game = Game.find(cookies.encrypted[:game_id])
      return redirect_to '/', alert: "Something broke"
    end
    @roles = Role.where(edition: @game.edition)
  end

  def player
    if cookies.encrypted[:player_id].nil?
      return redirect_to '/', alert: "No game found"
    end
    @player = Player.find(cookies.encrypted[:player_id])
    @game = @player.game
    @roles = Role.where(edition: @game.edition)
  end

  def lock
    @game = Game.find(cookies.encrypted[:game_id])
    @game.phase = 'assignment'
    @game.save
    redirect_to @game
  end

  def start
    @game = Game.find(cookies.encrypted[:game_id])
    @game.players.each do |player|
      if player.role.nil?
        return redirect_to @game, alert: "All players need a role."
      end
    end
    @game.phase = 'active'
    @game.save
    redirect_to @game
  end

  def assign
    @player = Player.find(params[:id])
    @player.update(assign_player)
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
    @player = Player.find(params[:id])
    @player.update(update_player)
    respond_to do |format|
      if @player.save
        @roles = Role.where(edition: @player.game.edition)
        format.js
      else
        return redirect_to '/game', alert: "Player update failed."
      end
    end
  end

  private
  def assign_player
    params.require(:player).permit(:role_id)
  end
  def update_player
    params.require(:player).permit(:role_id, :drunk, :dead, :poisoned, :misc1, :misc2, :notes)
  end

end
