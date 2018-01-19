class DashboardController < ApplicationController
  before_action :check_admin
  before_action :check_account_completeness

  def check_admin
    redirect_to admin_root_path if current_user.try(:has_role?,:admin)
  end

  def home
  end

  def check_account_completeness
    if !current_user.valid?
      redirect_to core_info_path
    elsif current_user.no_recruiter_company?
      redirect_to edit_recruiter_code_path
    elsif current_user.no_candidate_assessment?
      redirect_to complete_assessment_path
    end
  end

end
