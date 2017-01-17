class MapsController < ApplicationController

  def index
    @title = "My Family Map"

    @map_places = Map.where(group_id: current_user.group_id)

    @map_place = Map.find_by(user_id: current_user.id)

    render 'index.html.erb'
  end

  def create
    coordinates = Geocoder.coordinates(params["location"])

    @map_place = Map.create!(
      user_id: current_user.id,
      group_id: current_user.group_id,
      location: params["location"],
      description: User.find(current_user.id).first_name + " is at " + params["description"],
      latitude: coordinates[0],
      longitude: coordinates[1]
      )
  
    redirect_to '/maps'
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

    redirect_to '/maps'
  end

  def destroy
    # @map_place = Map.find_by(user_id: current_user.id)
    # @map_place.destroy
    # redirect_to '/maps'
  end
end
