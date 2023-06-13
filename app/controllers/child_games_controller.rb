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
    # @child_game.score = 10
    # @child_game.start_date = DateTime.now
    # @child_game.save!
  end

  def update
    # raise
    # passer des params ? dans l'url côté js et faire un if dessus pour rediriger vers le bon path (dans une méthode update)
  end
end
