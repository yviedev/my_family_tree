class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy, :newsfeed, :index, :new_family_member, :create_family_member]

  def home
    @title = "My Family Tree"
    render 'home.html.erb'
  end

  def index
    @title = "All Family Members"
  
    if current_user
      if params["sort_attribute"] && params["order"]
        @users = User.where(group_id: current_user.group_id).order(params["sort_attribute"] => params["order"])
      elsif params["search_content"]
        @users = User.where("lower (first_name) LIKE ? OR lower (last_name) LIKE ? AND group_id = ?", "%#{params['search_content'].downcase}%", "%#{params['search_content'].downcase}%", current_user.group_id)
      else
        @users = User.where(group_id: current_user.group_id)
      end
      # @users = User.all
  
      #link relationship between current_user and user
      @relationships = current_user.relationships
        
      render = 'index.html.erb'
    else
      redirect_to '/login'
    end
  end

  def show
    @title = "My Family Member"
    @current_user = current_user
    @user = User.find(params[:id])
    @relative_type_id = RelativeType.all.order('name ASC')
    @relationships = current_user.relationships

    # work on this later
    # @relationships.each do |r|
    #   if r.relative.id == @user.id
    #     @relationship = @user.id
    #   else
    #     @relationship = "Not available"
    #   end
    # end

    # @relationships.select { |r| r.relative == @user }
    # @relatioship = r.relative_type.name || "Not available"
  
    @relative_array = Relationship.where(user_id: current_user.id). where(relative_id: @user.id)
    if @relative_array[0]
      @relationship = RelativeType.find(@relative_array[0].relative_type_id).name
      @relationship_id = @relative_array[0].id
    else
      @relationship = "Not available"
    end
  
    render = 'show.html.erb'
  end

  def new
    @title = "Signup"
    @groups = Group.all.order('name ASC')
    @user = User.new
    render 'signup.html.erb'
  end

  def new_family_member
    @title = "Add New Family Member"
    @groups = Group.all.order('name ASC')
    @user = User.new
    # render 'newfamilymember.html.erb'
    respond_to do |format|
      format.html { render 'newfamilymember.html.erb' }
      format.js { render 'newfamilymember.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
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
      flash[:success] = "Congrats. Your account was created."
      redirect_to "/newsfeed"
    else
      flash[:warning] = "Please try again."
      render 'signup.html.erb'
    end
  end

  def create_family_member
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      group_id: current_user.group_id,
      birthday: params[:birthday],
      anniversary: params[:anniversary]
    )
    # if 
      @user.save(validate: false)
      flash[:success] = "Congrats. You added a new family member."
      # redirect_to "/familymembers"
      respond_to do |format|
        format.html { redirect_to '/familymembers' }
        format.js { render 'createfamilymember.js.erb' } #default behaviour is to run app/views/notes/create.js.erb file
      end
    # else
    #   flash[:warning] = "Please try and edit your family member again."
    #   render 'newfamilymember.html.erb'
    # end

    
  end

  def edit
    @title = "Edit Family Member"
    @groups = Group.all
    @user = User.find(params[:id])
    render 'editfamilymember.html.erb'
  end

  # write a method to update email & password but only for current_user
  def update
    @title = "Update Family Member"
    @groups = Group.all
    @user = User.find(params[:id])
  
    if @user.email || current_user.admin
      @user.update!(
        first_name: params[:first_name],
        last_name: params[:last_name],
        group_id: @user.group_id,
        birthday: params[:birthday],
        anniversary: params[:anniversary]
      )
      flash[:success] = "Congrats. You updated your family member info."
    else
      flash[:warning] = "Only user can update their information."
    end
    redirect_to "/familymembers/#{@user.id}"
    # else
    #   flash[:warning] = "Please try and edit your family member again."
    #   render 'edit.html.erb'
    # end
  end

  def destroy
    @title = "Delete Family Member"
    user = User.find(params[:id])
    user.destroy
    flash[:warning] = "You deleted your family member."
    redirect_to "/familymembers"
  end

end
