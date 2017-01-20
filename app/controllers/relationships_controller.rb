class RelationshipsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @title = "Add relationship"
    @current_user = current_user
    @user = User.find(params[:user_id])
    @relative_type_id = params[:relative_type_id]

    @relationship = Relationship.create!(
      user_id: current_user.id,
      relative_id: params[:user_id],
      relative_type_id: params[:relative_type_id],
      group_id: current_user.group_id
    )

    # if @relationship && Relationship.where(user_id: params[:user_id]). where(relative_id: current_user.id).nil? && params[:user_id] != current_user.id
    #   inverse_relationship = Relationship.create!(
    #     user_id: params[:user_id],
    #     relative_id: current_user.id,
    #     relative_type_id: Relationship.relative_type_id_inverse
    #   )
    # elsif @relationship && Relationship.where(user_id: params[:user_id]). where(relative_id: current_user.id) && params[:user_id] != current_user.id
    #   inverse_relationship = Relationship.where(user_id: params[:user_id]). where(relative_id: current_user.id)

    #   inverse_relationship = Relationship.update(
    #     id: inverse_relationship.id,
    #     user_id: params[:user_id],
    #     relative_id: current_user.id,
    #     relative_type_id: Relationship.relative_type_id_inverse
    #   )
    # end
    
    flash[:success] = "Congrats. You added a family relationship."
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

    # a = Relationship.where(user_id: params[:user_id]). where(relative_id: current_user.id). where(group_id: current_user.group_id)

    # if @relationship && a.nil? && params[:user_id] != current_user.id
    #   inverse_relationship = Relationship.create!(
    #     user_id: params[:user_id],
    #     relative_id: current_user.id,
    #     relative_type_id: Relationship.relative_type_id_inverse
    #   )
    # elsif @relationship && a && params[:user_id] != current_user.id

    #   inverse_relationship = Relationship.update(
    #     id: a.first.id,
    #     user_id: params[:user_id],
    #     relative_id: current_user.id,
    #     relative_type_id: Relationship.relative_type_id_inverse
    #   )
    # end
   

    flash[:success] = "Congrats. You updated your family relationship."
    redirect_to "/familymembers/#{@user.id}"
  end

  def destroy
  end
end
