class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ADMIN = 1
  REGISTRAR = 2
  TEACHER = 3
  STUDENT = 0
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    redirect_to destroy_sessions_path
  end
  
  def is_student?
    @current_user.role == STUDENT
  end
  
  def is_admin?
    @current_user.role == ADMIN
  end
  
  def is_registrar?
     @current_user.role == REGISTRAR
  end

  def is_teacher?
    @current_user.role == TEACHER
  end
  
  helper_method :is_student?
  
  helper_method :is_teacher?
  
  helper_method :is_admin?
  
  helper_method :is_registrar?

  helper_method :current_user

  def authorize
    redirect_to new_sessions_path unless current_user
  end
  
  def redirect_if_student_or_teacher
    if is_student? || is_teacher?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_registrar
    if is_registrar?
     redirect_to "/portal"
    end
  end
  
  def redirect_if_not_admin
    if !is_admin?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_not_registrar
    if !is_registrar?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
  
  def redirect_if_not_r_or_a
    if is_registrar? && is_admin?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false) 
    end
  end
  
end
