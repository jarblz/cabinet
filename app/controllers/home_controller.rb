class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_action :redirect_if_logged_in
  def index
  end

  private

  def redirect_if_logged_in
    redirect_to root_path if current_user
  end
end
