class AddLatitudeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :latitude, :decimal
  end
end
