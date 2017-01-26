class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home, :new, :create]

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
        
      render = 'index.html.erb'
    else
      redirect_to '/login'
    end
  end

  def show
    @title = "My Family Member"
    @user = User.find(params[:id])
    @relative_type_id = RelativeType.all.order('name ASC')

    @relationships = Relationship.where("user_id = ? AND relative_id = ? OR user_id = ? AND relative_id = ?", current_user.id, @user.id, @user.id, current_user.id)
    if @relationships[0]
      @relationships.each do |relationship|
        if relationship.user_id == current_user.id
          @relationship_name = RelativeType.find(relationship.relative_type_id).name
          @relationship = relationship
        elsif relationship.relative_id == current_user.id
          @relationship_name = RelativeType.find(relationship.relative_type_id).inverse_name
          @relationship = relationship
        end
      end
    else
      @relationship_name = "Please add"
    end

    if current_user.group_id == @user.group.id || current_user.admin
      render = 'show.html.erb'
    else
      redirect_to "/newsfeed"
    end

    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "Family member not found."
      redirect_to "/familymembers"
  end

  def new
    @title = "Signup"
    @groups = Group.all.order('name ASC')
    @user = User.new
    # render 'signup.html.erb'
    respond_to do |format|
      format.html { render 'signup.html.erb' }
      format.js { render 'signup.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
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
      relationship = Relationship.create(
        user_id: @user.id,
        relative_id: @user.id,
        relative_type_id: 1,
        group_id: @user.group_id
      )
    end
    # if @user.save
    #   session[:user_id] = @user.id
    #   flash[:success] = "Congrats. Your account was created."
    #   redirect_to "/newsfeed"
    # else
    #   flash[:warning] = "Please try again."
    #   render 'signup.html.erb'
    # end

    respond_to do |format| 
    format.html {
      if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Congrats. Your account was created."
        redirect_to '/newsfeed'
      else
        flash[:warning] = "Please try again."
      render 'signup.html.erb'
      end
    }
    format.js {
      if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Congrats. Your account was created."
        render 'create.js.erb'
      else
        flash[:warning] = "Please try again."
      render 'signup.html.erb'
      end
    }
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
    if params[:first_name].blank? || params[:last_name].blank?
      flash[:warning] = "You must enter a name to continue. Please try again"
      redirect_to "/familymembers/new" and return
    end

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

    if current_user.group_id == @user.group_id
    # render 'editfamilymember.html.erb'
      respond_to do |format|
        format.html { render 'editfamilymember.html.erb' }
        format.js { render 'editfamilymember.js.erb' } #default behaviour is to run app/views/notes/create.js.erb file
      end
    else
      redirect_to "/familymembers"
    end
  end

  # write a method to update email & password but only for current_user
  def update
    @title = "Update Family Member"
    @groups = Group.all
    @user = User.find(params[:id])
  
  if current_user.group_id == @user.group_id
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
      flash[:warning] = "Umm. Only user can update their information."
    end
    # redirect_to "/familymembers/#{@user.id}"
    respond_to do |format|
      format.html { redirect_to "/familymembers/#{@user.id}" }
      format.js { render 'updatefamilymember.js.erb' } #default behaviour is to run app/views/notes/create.js.erb file
    end
    # else
    #   flash[:warning] = "Please try and edit your family member again."
    #   render 'edit.html.erb'
    # end
    else
      redirect_to "/familymembers"
    end
  end

  def destroy
    @title = "Delete Family Member"

    @user = User.find_by(id: params[:id])
    
    if current_user.group_id == @user.group_id || current_user.admin
      
      @relationships = Relationship.where("user_id = ? OR relative_id = ?", @user.id, @user.id)
      
      @relationships.each do |relationship|
        relationship.destroy
      end

      @user.destroy

      flash[:warning] = "You deleted #{@user.first_name}."
    
    end

    redirect_to "/familymembers"
  end

end
