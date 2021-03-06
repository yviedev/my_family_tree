class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    like = Like.create!(
      status_update_id: params[:status_update_id],
      user_id: current_user.id
    )

    redirect_to '/newsfeed'
  end
  
  def update
    like = Like.find(params[:id])
    status_update_id = like.status_update_id
    p "I'm in the update action"
    like.update(
      vote: !like.vote
    )
    redirect_to "/newsfeed/#like-#{status_update_id}"
  end

  # def destroy
  #   like = Like.find(params[:id])
  #   like.destroy
  #   redirect_to '/newsfeed'
  # end

end
