class GamesController < ApplicationController
  def index
    @child = Child.find(params[:child_id])
    @games = Game.all
  end
end
