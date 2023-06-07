class ChildGamesController < ApplicationController
  def create
    @child = Child.find(params[:child_id])
    @game = Game.find(params[:game_id])
    @child_game = ChildGame.new(child: @child, game: @game)
    @child_game.save!
    redirect_to child_game_path(@child_game)
  end

  def show
    @child_game = ChildGame.find(params[:id])
  end
end
