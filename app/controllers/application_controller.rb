class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_current_user
  def load_current_user
    if session[:userid]
      @current_user = User.find(session[:userid])
    end
  end
end
