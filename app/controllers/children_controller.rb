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
  end








  private

  def child_params
    params.require(:child).permit(:first_name, :age)
  end

end
