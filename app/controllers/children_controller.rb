class ChildrenController < ApplicationController
  def index
    @user = current_user
    @children = @user.children
  end

  def create
    @child = Child.new(child_params)
    @child.save!
    redirect_to children_path
  end

  def new
    @child = Child.new
  end

  def show
    @child = Child.find(params[:id])
    @child_game = ChildGame.where(child: @child)
    @games = @child.games.all
    @total_score = 0
    @screen_time = 0

    @child_game.each do |child_game|
      if child_game.game.name == "Mémoire d'éléphant"
        @total_score += child_game.score
        @screen_time += (child_game.end_date - child_game.start_date) / 1.minutes
      end

    end











    # @game_id = params[:game_id]

    # Rechercher le jeu spécifié
    # @game = Game.find(@game_id)

    # Rechercher les enregistrements ChildGame pour l'enfant et le jeu spécifiés
    # @child_game = ChildGame.find_by(child_id: @child.id, game_id: @game.id)




    # @child_game = ChildGame.new(child: @child, game: @game)
    # @child_game = ChildGame.find(params[:id])
    # @score = @child_game.map



  end

  private

  def child_params
    params.require(:child).permit(:first_name, :age)
  end
end
