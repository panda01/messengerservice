class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :from_loc
      t.references :to_loc
      t.datetime :requested_time
      t.text :desc
      t.integer :weight
      t.string :package_type
      t.string :type

      t.timestamps
    end
    add_index :orders, :from_loc_id
    add_index :orders, :to_loc_id
  end
end
