class RelationshipsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @title = "Add relationship"
    @current_user = current_user
    @user = User.find(params[:user_id])

    @relationship = Relationship.create!(
      user_id: current_user.id,
      relative_id: params[:user_id],
      relative_type_id: params[:relative_type_id],
      group_id: current_user.group_id
    )

    # if @relationship.save
    #   @relationship1 = Relationship.create!(
    #   user_id: current_user.id,
    #   relative_id: params[:user_id],
    #   relative_type_id: params[:relative_type_id]
    #   )
    # end
    
    flash[:success] = "Congrats. You added a family relationship."
    redirect_to "/familymembers/#{@user.id}"
      
  end

  def show
  end

  def edit
    @relationship = Relationship.find(params[:id])
    @user = current_user
    @relative = User.find(@relationship.relative_id)
    @relative_type_id = RelativeType.all
    render 'edit.html.erb'
  end

  def update
    @title = "Edit relationship"
    @current_user = current_user
    @relationship = Relationship.find(params[:id])
    @user = User.find(@relationship.relative_id)

    @relationship.update(
      relative_type_id: params[:relative_type_id]
    )

    flash[:success] = "Congrats. You updated your family relationship."
    redirect_to "/familymembers/#{@user.id}"
  end

  def destroy
  end
end
