class AddLongitudeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :longitude, :decimal
  end
end
