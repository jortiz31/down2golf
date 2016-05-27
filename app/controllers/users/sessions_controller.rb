class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]
# prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  def new
    super
    redirect_to "courses_path"
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
