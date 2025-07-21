class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :employee_number, :furigana, :department, :phone_number, :administrator_flag])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :employee_number, :furigana, :department, :phone_number, :administrator_flag])
  end

  private

  def user_not_authorized
    flash[:alert] = "アクセス権限がありません。"
    redirect_back(fallback_location: root_path)
  end
end
