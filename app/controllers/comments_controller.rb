class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @comment = Comment.create!(
      post: params[:post],
      status_update_id: params[:status_update_id] 
    )

    redirect_to '/newsfeed'
  end

  def show
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to '/newsfeed'
  end

end
