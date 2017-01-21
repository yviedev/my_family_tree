class ImagesController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    @image = Image.new(
      url: params[:url],
      user_id: params[:user_id]
    )

    @user = User.find(@image.user_id)

    if @image.save
      flash[:success] = "Congrats. Your image was added to your account."
    else
      flash[:warning] = "Please try again."
    end
    redirect_to "/familymembers/#{@user.id}"
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
    image.destroy
    flash[:warning] = "You deleted your image."
    redirect_to "/familymembers/#{user.id}"
  end

end
