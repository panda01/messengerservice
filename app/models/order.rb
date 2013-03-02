class Order < ActiveRecord::Base
  belongs_to :from_loc
  belongs_to :to_loc
  attr_accessible :desc, :package_type, :requested_time, :type, :weight
end
