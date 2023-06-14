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
   # @week_time = ChildGame.where("end_date >= ? AND start_date <= ?", 7.days.ago, Time.now)
    @week_time = ChildGame.where("end_date >= ? AND start_date <= ? AND child_id = ?", 7.days.ago, Time.now, @child.id)
    @screen_week = 0
    @screen_week_per_child = 0



    @child_game.each do |child_game|
        @total_score += child_game.score
        @screen_time += ((child_game.end_date - child_game.start_date) /60).to_i
      end



        @week_time.each do |week_time|
         @screen_week += ((week_time.end_date - week_time.start_date) /60).to_i
        end


  end



  private

  def child_params
    params.require(:child).permit(:first_name, :birth_date, :alarm, :avatar)
  end

end
