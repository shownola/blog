class ApplicationController < ActionController::Base

  before_action :set_copyright

  def set_copyright
    @copyright = ShownolaViewTool::Renderer.copyright 'Shownola | Sherry Wasieko', 'All rights reserved'
  end
end

module ShownolaViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b> #{name}</b> #{msg}" .html_safe
    end
  end
end
