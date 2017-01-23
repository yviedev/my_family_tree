class StatusUpdatesController < ApplicationController

  def index
    @title = "My Newsfeed"
    if current_user
      @status_updates = Group.find(current_user.group_id).status_updates.order('created_at DESC').limit(5)

      @familymembers = User.where(group_id: current_user.group_id)
      @familymembers.each do |familymember|
        if familymember.birthday.strftime("%B %-d") == DateTime.now.strftime("%B %-d")
          flash[:info] = "Hey! Today is #{familymember.first_name}'s birthday. Wish #{familymember.first_name} a happy birthday on the Newsfeed!"
          p "Hey! Today is #{familymember.first_name}'s birthday. Wish them a happy birthday on your Newsfeed!"
        elsif familymember.anniversary == DateTime.now
          flash[:info] = "Hey! Today is #{familymember.first_name}'s anniversary. Wish #{familymember.first_name} a happy anniversary on the Newsfeed!"
        end
      end

      render 'index.html.erb'
    else
      redirect_to '/login'
    end
  end

  def new
    @title = "Update My Status"
    respond_to do |format|
      # format.html { render 'new.html.erb' }
      format.js { render 'new.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def create
    @status_update = StatusUpdate.create!(
      post: params[:post],
      url: params[:url],
      user_id: current_user.id
    )

    @like = Like.create!(
      status_update_id: @status_update.id,
      user_id: current_user.id
    )

    # redirect_to '/newsfeed'
    respond_to do |format|
      format.html { redirect_to '/newsfeed' }
      format.js { render 'create.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def destroy
    status_update = StatusUpdate.find(params[:id])
    status_update.destroy
    flash[:warning] = "Your status update has been deleted."
    redirect_to '/newsfeed'
  end

end
