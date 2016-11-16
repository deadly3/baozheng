class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
