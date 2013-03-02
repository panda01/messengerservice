class Location < ActiveRecord::Base
  belongs_to :user
  has_many :order
  attr_accessible :city, :state, :street_1, :street_2, :zip
end
