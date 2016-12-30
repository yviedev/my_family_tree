class RelationshipsController < ApplicationController
  def index
  end

  def new
    render 'new.html.erb'
  end

  def create
    @title = "Add relationship"
    @current_user = current_user
    @user = User.find(params[:user_id])

    @relationship = Relationship.create!(
      user_id: current_user.id,
      relative_id: params[:user_id],
      relative_type_id: params[:relative_type_id]
    )

    # if @relationship.save
    #   @relationship1 = Relationship.create!(
    #   user_id: current_user.id,
    #   relative_id: params[:user_id],
    #   relative_type_id: params[:relative_type_id]
    #   )
    # end
    
    redirect_to "/familymembers/#{@user.id}"
      
  end

  def show
  end

  def edit
    @relationship = Relationship.find(params[:id]),
    @user = current_user
    @relative_type_id = RelativeType.all
    render 'edit.html.erb'
  end

  def update
    @title = "Edit relationship"
    @current_user = current_user
    @user = User.find(params[:user_id])

    @relationship = Relationship.update(
      user_id: current_user.id,
      relative_id: params[:user_id],
      relative_type_id: params[:relative_type_id]
    )
  end

  def destroy
  end
end
