class DashboardController < ApplicationController
  before_action :check_account_completeness, only: [:home]
  
  def home
  end

  def incomplete_user_setup
  end

  def check_account_completeness
    redirect_to incomplete_user_setup_path if !current_user.active?
  end

end
