class DashboardController < ApplicationController
  before_action :check_admin, only: [:home]
  before_action :check_account_completeness, only: [:home]

  def check_admin
    redirect_to admin_root_path if current_user.try(:has_role?,:admin)
  end

  def home
  end

  def incomplete_user_setup
  end

  def link_recruiter_company
    if current_user.company_recruiter?
      redirect_to root_path, notice: 'You have already been linked to a company.'
    end
    if params[:company_code]
      if Company.exists? code: params[:company_code]
        current_user.link_company(params[:company_code])
        redirect_to root_path, notice: "You're now part of the #{current_user.company.name} organization."
      else
        redirect_to link_company_path, alert: 'invalid company code'
      end
    end
  end

  def check_account_completeness
    redirect_to incomplete_user_setup_path if !current_user.active?
  end

end
