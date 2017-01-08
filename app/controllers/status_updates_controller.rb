class StatusUpdatesController < ApplicationController

  def index
    @title = "My Newsfeed"
    if current_user
      @messages = Group.find(current_user.group_id).status_updates.order('created_at DESC').limit(5)

      render 'index.html.erb'
    else
      redirect_to '/login'
    end
  end

  def new
  
  end

  def create
    @status_update = StatusUpdate.create!(
      post: params[:post],
      url: params[:url],
      user_id: params[:user_id]
    )

    redirect_to '/newsfeed'
  end

  def delete
    redirect_to '/newsfeed'
  end

end
