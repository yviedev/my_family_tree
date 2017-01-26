class ImagesController < ApplicationController
  before_action :authenticate_user

  def new
    @user = User.find(params[:user_id])
    # render 'new.html.erb'
    respond_to do |format|
      format.html { render 'new.html.erb' }
      format.js { render 'new.js.erb' } #default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def create
    @image = Image.new(
      url: params[:url],
      user_id: params[:user_id]
    )

    @user = User.find(@image.user_id)

    if current_user.id == image.user_id || current_user.admin
      if @image.save
        flash[:success] = "Congrats. Your image was added below."
      else
        flash[:warning] = "Oops. Please try again."
      end
      # redirect_to "/familymembers/#{@user.id}"
      respond_to do |format|
        format.html { redirect_to "/familymembers/#{@user.id}" }
        format.js { render 'create.js.erb' } #default behaviour is to run app/views/notes/create.js.erb file
      end
    else
      redirect_to "/familymembers"
    end
  end

  def show
  end

  def edit
  end
  
  def update
  end

  def destroy
    image = Image.find(params[:id])
    user = User.find(image.user_id)

    if current_user.id == image.user_id || current_user.admin
      image.destroy
      flash[:warning] = "You deleted your image."
      redirect_to "/familymembers/#{user.id}"
    else
      redirect_to "/familymembers"
    end
  end

end
