class UsersController < ApplicationController

  def index
    @title = "All Family Members"
    @users = User.where(group_id: current_user.group_id)
    # @users = User.all
    @relationships = current_user.relationships
    render = 'index.html.erb'
  end

  def show
    @title = "Family Member"
    @user = User.find(params[:id])
    @relationships = current_user.relationships
    render = 'show.html.erb'
  end

  def new
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthday: params[:birthday],
      anniversary: params[:anniversary],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
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
