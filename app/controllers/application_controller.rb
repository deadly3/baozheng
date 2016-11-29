class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  require 'devise'

  protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :email, :password, :remember_me])
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  def require_is_designer
    if !current_user.designer?
      flash[:alert] = "你还不是达人，成为达人，开始接单吧"
      redirect_to "/"
    end
  end


  def avatar!
    if current_user.avatar.present?
      image_tag(current_user.avatar.thumb.url)
    else
      image_tag current_user.gravatar_url(:size => 100)
    end
  end

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:warning] = 'Resource not found.'
  #   redirect_back_or root_path
  # end
  #
  # def redirect_back_or(path)
  #   redirect_to request.referer || path
  # end


end
