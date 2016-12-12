class UsersController < ApplicationController

  def index
    @users = User.all
    render = 'index.html.erb'
  end

  def show
    @user = User.find(params[:id])
    render = 'show.html.erb'
  end

  def new
    @user = User.create!(
      
    )
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
