class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:act_on_recommendation]


  def connections
    @connections = set_connections
  end

  def recommendations
    @recommendations = set_recommendations
  end

  def act_on_recommendation
    if params[:accept]
      @recommendation.approve(current_user.recruiter? ? :recruiter : :candidate)
      result = 'accepted'
    else
      result = 'denied'
      @recommendation.deny(current_user.recruiter? ? :recruiter : :candidate)
    end

    respond_to do |format|
      if @recommendation.errors.any?
        format.json { render(json: "error") }
      else
        format.json { render(json: {result: result, recommendation: @recommendation}.to_json) }
      end
    end

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

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

end
