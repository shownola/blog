class ApplicationController < ActionController::Base
  before_action :set_copyright

  def set_copyright
    @copyright = ShownolaViewTool::Renderer.copyright 'Shownola | Sherry Wasieko', 'All rights reserved'
  end


  helper_method :current_user, :logged_in?  # this makes the method available for the views

  # transferred from application helper to make available to all controllers
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user  # this makes it a boolean
  end

  def require_user
    if !logged_in?
      flash[:alert] = 'You must be logged in to perform this action'
      redirect_to login_path
    end
  end

  

end

module ShownolaViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b> #{name}</b> #{msg}" .html_safe
    end
  end
end
