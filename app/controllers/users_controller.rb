class UsersController < ApplicationController

  def index
    @title = "All Family Members"

    if current_user
      @users = User.where(group_id: current_user.group_id)
    # @users = User.all
      @relationships = current_user.relationships
      render = 'index.html.erb'
    else
      redirect_to '/login'
    end
  end

  def show
    @title = "Family Member"
    @user = User.find(params[:id])
    @relationships = current_user.relationships
    render = 'show.html.erb'
  end

  def new
    @title = "Signup"
    @groups = Group.all.order('name ASC')
    @user = User.new
    render 'new.html.erb'
  end

  def newfamilymember
    @title = "New Family Member"
    render 'newfamilymember.html.erb'
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      group_id: params[:groups],
      birthday: params[:birthday],
      anniversary: params[:anniversary],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Congrats. You added a new family member."
      redirect_to "/"
    else
      render 'new.html.erb'
    end

  end

  def edit
    @title = "Edit Family Member"
    @user = User.find(params[:id])
    redirect_to "/familymembers/#{@user.id}"
  end

  def update
    @title = "Update Family Member"
    @user = User.find(params[:id])
    @user = User.update(
      first_name: params[:first_name] || user.first_name,
      last_name: params[:last_name] || user.last_name,
      group_id: params[:group_id] || user.group_id,
      birthday: params[:birthday] || user.birthday,
      anniversary: params[:anniversary] || user.anniversary,
      email: params[:email] || user.email,
      password: params[:password] || user.password,
      password_confirmation: params[:password_confirmation] || user.password_confirmation
    )
      redirect_to "/familymembers/#{@user.id}"
    else
      render 'edit.html.erb'
  end

  def destroy
    @title = "Delete Family Member"
    user = User.find(params[:id])
    user.destroy
    redirect_to "/"
  end

end
