class AddLatitudeAndLongitudeToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :latitude, :float
    add_column :maps, :longitude, :float
  end
end
