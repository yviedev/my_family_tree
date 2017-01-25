class MapsController < ApplicationController

  def index
    @title = "My Family Map"

    @map_places = Map.where(group_id: current_user.group_id)

    @map_place = Map.find_by(user_id: current_user.id)

    render 'index.html.erb'
  end

  def new
    respond_to do |format|
      format.html { render 'new.html.erb' }
      format.js { render 'new.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def create
    coordinates = Geocoder.coordinates(params["location"])

    @map_place = Map.create!(
      user_id: current_user.id,
      group_id: current_user.group_id,
      location: params["location"],
      description: "<a href='/familymembers/#{current_user.id}'>#{User.find(current_user.id).first_name}</a>" + " " + params["description"],
      latitude: coordinates[0],
      longitude: coordinates[1]
      )
  
    respond_to do |format|
      format.html { redirect_to '/maps' }
      format.js { render 'create.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def edit

    @map_place = Map.find_by(user_id: current_user.id)
    
    respond_to do |format|
      format.html { redirect_to '/maps' }
      format.js { render 'edit.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def update
    coordinates = Geocoder.coordinates(params["location"])

    @map_place = Map.find_by(user_id: current_user.id)

    @map_place.update(
      location: params["location"],
      description: "<a href='/familymembers/#{current_user.id}'>#{User.find(current_user.id).first_name}</a>" + " " + params["description"],
      latitude: coordinates[0],
      longitude: coordinates[1]
    )

    respond_to do |format|
      format.html { redirect_to '/maps' }
      format.js { render 'update.js.erb' }#default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def destroy
    # @map_place = Map.find_by(user_id: current_user.id)
    # @map_place.destroy
    # redirect_to '/maps'
  end
end
