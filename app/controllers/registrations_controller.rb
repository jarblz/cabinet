class RegistrationsController < Devise::RegistrationsController
  
  protected

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  # def after_sign_up_path_for(resource)
  #   successful_registration_path(resource)
  # end

  # If the account that is registered is confirmable and not active yet,
  # you have to override after_inactive_sign_up_path_for method.
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

end
