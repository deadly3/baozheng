class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    si_attrs = [:email, :password, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: si_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
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
