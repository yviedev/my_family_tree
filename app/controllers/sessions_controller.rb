class SessionsController < ApplicationController

  def new
    # render 'new.html.erb'
    respond_to do |format|
      format.html { render 'new.html.erb' }
      format.js { render 'new.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def create
    user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   flash[:success] = "Welcome back #{current_user.first_name}!"
    #   redirect_to '/newsfeed'
    # else
    #   flash[:warning] = 'Invalid email or password!'
    #   redirect_to '/login'
    # end

    respond_to do |format| 
    format.html {
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back #{current_user.first_name}!"
        redirect_to '/newsfeed'
      else
        redirect_to '/login'
      end
    }
    format.js {
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back #{current_user.first_name}!"
        render 'create.js.erb'
      else
        redirect_to '/login'
      end
    }
    end
  
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See you soon!"
    redirect_to '/login'
  end

end
