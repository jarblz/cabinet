class SessionsController < Devise::SessionsController
  before_filter :remove_authentication_flash_message_if_root_url_requested

  protected

  private

  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == dashboard_root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
  end

end
