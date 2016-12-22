class GroupsController < ApplicationController

  def index
    @groups = Group.all
    render 'index.html.erb'
  end

  def new
    @title = "New Family Group"
    render 'new.html.erb'
  end

  def create
    @group = Group.new(
    name: params[:name],
    )

    if @group.save
      flash[:success] = "Congrats. You created a new group."
      redirect_to '/signup'
    else
      render 'new.html.erb'
    end
  end

end
