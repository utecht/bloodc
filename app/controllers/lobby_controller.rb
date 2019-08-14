class LobbyController < ApplicationController
  def show
    @game = Game.new
  end

  def host
    @game = Game.new(game_params)
    @game.phase = 'joining'
    @game.save
    redirect_to @game
  end

  def join
    @game = Game.find_by(name: params[:game])
    @player = Player.new(name: params[:name], game: @game)
    @player.save!
    session[:player_id] = @player.id
    redirect_to '/player'
  end

  private
    def game_params
      params.require(:game).permit(:name, :edition)
    end
end
