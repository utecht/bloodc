class LobbyController < ApplicationController
  def show
    @game = Game.new
  end

  def host
    @game = Game.new(game_params)
    @game.phase = 'joining'
    @game.save
    session[:game_id] = @game.id
    redirect_to @game
  end

  def join
    @game = Game.find_by(name: params[:game])
    if @game.nil?
      return redirect_to '/', alert: "That game does not exist."
    end
    demon = if params.has_key?(:demon) then true else false end
    @player = Player.new(name: params[:name], game: @game, willing_demon: demon)
    @player.save!
    session[:player_id] = @player.id
    redirect_to @player
  end

  private
    def game_params
      params.require(:game).permit(:name, :edition)
    end
end
