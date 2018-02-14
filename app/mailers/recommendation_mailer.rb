class RecommendationMailer < ApplicationMailer

  def recruiter_recommendation(recommendation)
    @recommendation = recommendation
    @recruiter = @recommendation.recruiter
    set_url(recommendation)
    mail(to: @recruiter.email, subject: 'You have a new recommendation!')
  end

  def candidate_recommendation(recommendation)
    @recommendation = recommendation
    set_url(recommendation)
    mail(to: @recommendation.candidate.email, subject: 'You have a new recommendation!')
  end

  def recruiter_match(recommendation)
    @recommendation = recommendation
    @recruiter = @recommendation.recruiter
    set_url(recommendation)
    mail(to: @recruiter.email, subject: 'You have a new connection!')
  end

  def set_url(recommendation)
    if recommendation.company
      @url = recommendations_path(:company)
    else
      @url = recommendations_path(:job)
    end
  end

end
