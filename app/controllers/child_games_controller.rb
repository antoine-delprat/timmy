class ChildGamesController < ApplicationController
  def create
    @child_game = ChildGame.new(:child_id, :game_id)
    @child_game.save!
    redirect_to child_game_path(@child_game)
  end

  def show
    @child_game = ChildGame.find(params[:id])
  end
end
