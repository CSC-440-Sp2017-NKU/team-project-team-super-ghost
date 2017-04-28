class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    redirect_to destroy_sessions_path
  end

  helper_method :current_user

  def authorize
    redirect_to new_sessions_path unless current_user
  end
  
  def signed_in?
    !!current_user
  end
  
  def redirect_if_registrar
    if @current_user.role == 2
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_not_admin
    if @current_user.role != 1
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_not_registrar
    if @current_user.role != 2
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_not_r_or_a
  
    if @current_user.role !=2 && @current_user.role != 1
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false) 
    end
  end
  
end
