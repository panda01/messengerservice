class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :role
  has_many :locations
  ROLES = %w[admin messenger customer]
  validates :email, :format => {
    :with     => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
    :message  => "Not a valid email address"
  }
  validates :name, :length => { :minimum => 1, :maximum => 15 }
  validates :password, :length => { :minimum => 6, :maximum => 12 }
end
