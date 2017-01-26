class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    @title = "Add relationship"
    @current_user = current_user
    @user = User.find(params[:user_id])
    @relative_type_id = params[:relative_type_id]

    @relationship = Relationship.new(
      user_id: current_user.id,
      relative_id: params[:user_id],
      relative_type_id: params[:relative_type_id],
      group_id: current_user.group_id
    )

    if @relationship.save
      flash[:success] = "Congrats. You added a family relationship."
    else
      flash[:warning] = "Oops. Please try again."
    end

    redirect_to "/familymembers/#{@user.id}"
      
  end

  def show
  end

  def edit
    @title = "Edit Relationship"
    @relationship = Relationship.find(params[:id])
    @user = current_user
    @relative = User.find(@relationship.relative_id)
    @relative_type_id = RelativeType.all
    # render 'edit.html.erb'
    respond_to do |format|
      format.html { render 'edit.html.erb' }
      format.js { render 'edit.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def update
    @title = "Edit relationship"
    @relationship = Relationship.find(params[:id])
    @user = User.find(@relationship.relative_id)

    if @relationship.user_id = current_user.id || current_user.admin!
      @relationship.update(
        relative_type_id: params[:relative_type_id]
      )

      flash[:success] = "Congrats. You updated your family relationship."
    else
      flash[:warning] = "Oops. This family relationship was not updated."
    end
    # redirect_to "/familymembers/#{@user.id}"
    respond_to do |format|
      format.html { redirect_to "/familymembers/#{@user.id}" }
      format.js { render 'uupdate.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def destroy
  end

end
