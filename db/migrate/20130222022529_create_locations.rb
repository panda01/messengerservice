class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.references :user

      t.timestamps
    end
    add_index :locations, :user_id
  end
end
