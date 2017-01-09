class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @comment = Comment.create!(
      user_id: current_user.id,
      post: params[:post],
      status_update_id: params[:status_update_id]
    )

    flash[:success] = "Your comment has been added."
    redirect_to '/newsfeed'
  end

  def show
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:warning] = "Your comment has been deleted."
    redirect_to '/newsfeed'
  end

end
