class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def can_change_object?(object)
    if object.user != current_user
        flash[:error] = "Insufficient permissions"
        if object.class == Review
          redirect_to space_path(object.space)
        else
          redirect_to object.class.name.downcase_path
        end
    end
  end

end
