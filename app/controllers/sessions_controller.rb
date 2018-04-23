class SessionsController < Devise::SessionsController
  before_filter :remove_authentication_flash_message_if_root_url_requested

  protected

  private


  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to 'https://getunboxt.com' }
    end
  end

  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
  end

end
