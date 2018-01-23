class DashboardController < ApplicationController
  before_action :check_admin
  before_action :check_account_completeness, except: [:incomplete_user]

  def check_admin
    redirect_to admin_root_path if current_user.try(:has_role?,:admin)
  end

  def home
  end

  def incomplete_user
  end

  def check_account_completeness
    if !current_user.active?
      redirect_to incomplete_user_path
    end
  end

end
