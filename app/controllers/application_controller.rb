class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :require_login

  private 

  def require_login
    redirect_to login_url unless current_user
  end

  def current_user
    @current_user ||= User.find session[:user]['_id']['$oid']
  end

  def admin_only
    unless current_user.admin?
      render :status => :forbidden, :text => "Acesso Negado"
    end
  end

  def registered_only
    unless current_user.registered?
      render :status => :forbidden, :text => "Acesso Negado"
    end
  end

  helper_method :current_user

end
