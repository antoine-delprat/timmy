class ChildrenController < ApplicationController
  def index
    @children = Children.all
  end
end
