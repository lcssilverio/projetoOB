class ApplicationController < ActionController::Base
  helper_method :rendering

  def rendering(view)
    render view
  end
end
