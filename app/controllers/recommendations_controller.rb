class RecommendationsController < ApplicationController



  def connections
    @connections = set_connections
  end

  def recommendations
    @recommendations = set_recommendations
  end

  def act_on_recommendation
    binding.pry
    # TODO: accept/deny post goes here
  end

  private

  def set_connections
    if params[:type] == 'company'
      current_user.recruiter? ? current_user.recruiter_company_connections : current_user.candidate_company_connections
    else
      current_user.recruiter? ? current_user.recruiter_job_connections : current_user.candidate_job_connections
    end
  end

  def set_recommendations
    if params[:type] == 'company'
      current_user.recruiter? ? current_user.recruiter_company_recommendations : current_user.candidate_company_recommendations
    else
      current_user.recruiter? ? current_user.recruiter_job_recommendations : current_user.candidate_job_recommendations
    end
  end

end
