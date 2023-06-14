class ChildrenController < ApplicationController
  def index
    @user = current_user
    @children = @user.children
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user
    if @child.save
      redirect_to children_path
    else
      render :new, status: :unprocessable_entity
    end
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
    @week_time = ChildGame.where("end_date >= ? AND start_date <= ? AND child_id = ?", 7.days.ago, Time.now, @child.id)
    @screen_week = 0
    # @games_names = ["Mémoire d'éléphant", ]

    @child_game.each do |child_game|
      @total_score += child_game.score
      @screen_time += ((child_game.end_date - child_game.start_date) / 60).to_i
    end

    @week_time.each do |week_time|
      @screen_week += ((week_time.end_date - week_time.start_date) / 60).to_i
    end

    score_per_game
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :birth_date, :alarm, :avatar)
  end

  def score_per_game
    @score_game1 = 0
    @name_game1 = nil
    @time_game1 = 0
    @score_game2 = 0
    @name_game2 = nil
    @time_game2 = 0
    @score_game3 = 0
    @name_game3 = nil
    @time_game3 = 0
    @score_game4 = 0
    @name_game4 = nil
    @time_game4 = 0
    @score_game5 = 0
    @name_game5 = nil
    @time_game5 = 0
    @score_game6 = 0
    @name_game6 = nil
    @time_game6 = 0
    @score_game7 = 0
    @name_game7 = nil
    @time_game7 = 0
    @score_game8 = 0
    @name_game8 = nil
    @time_game8 = 0
    @score_game9 = 0
    @name_game9 = nil
    @time_game9 = 0

      @child_game.each do |game|
        if game.game.name == "Mémoire d'éléphant"
          @score_game1 += game.score.to_i
          @name_game1 = game.game.name
          @time_game1 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Génie des maths"
          @score_game2 += game.score.to_i
          @name_game2 = game.game.name
          @time_game2 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Animaux en puzzle"
          @score_game3 += game.score.to_i
          @name_game3 = game.game.name
          @time_game3 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Sons en folie"
          @score_game4 += game.score.to_i
          @name_game4 = game.game.name
          @time_game4 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Chasse aux papillons"
          @score_game5 += game.score.to_i
          @name_game5 = game.game.name
          @time_game5 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Rebus"
          @score_game6 += game.score.to_i
          @name_game6 = game.game.name
          @time_game6 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Couleurs partout"
          @score_game7 += game.score.to_i
          @name_game7 = game.game.name
          @time_game7 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Jeu de billes"
          @score_game8 += game.score.to_i
          @name_game8 = game.game.name
          @time_game8 += ((game.end_date - game.start_date) / 60).to_i
        elsif game.game.name == "Trouve les lettres"
          @score_game9 += game.score.to_i
          @name_game9 = game.game.name
          @time_game9 += ((game.end_date - game.start_date) / 60).to_i
        end
      end
  end
end
