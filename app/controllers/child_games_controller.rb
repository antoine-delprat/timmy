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
    @child_game.score = 0
    @child_game.start_date = DateTime.now
    @child_game.save!
  end

  def update
    @update_game = ChildGame.find(params[:id])
    @update_game.end_date = DateTime.now
    @update_game.save!

    if params[:link] == "games"
      @update_game.score = 10
      @update_game.save!
      redirect_to child_games_path(@update_game.child.id)
    elsif params[:link] == "newgame"
      @update_game.score = 10
      @update_game.save!
      @new_child_game = ChildGame.create(child: @update_game.child, game: @update_game.game)
      redirect_to child_game_path(@new_child_game)
    elsif params[:link] == "back"
      redirect_to child_games_path(@update_game.child.id)
    end
  end
end

# child_game_child_game PATCH  /children/:child_id/games/:game_id/child_games/:id(.:format)
# <a data-turbo-method=\"patch\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games/" + this.childgameValue + "?link=games\">
# <a data-turbo-method=\"patch\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games/" + this.childgameValue + "?link=newgame\">
