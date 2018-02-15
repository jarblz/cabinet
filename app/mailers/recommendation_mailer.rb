class RecommendationMailer < ApplicationMailer
  default from: 'notifications@unboxt.com'

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
      @url = recommendations_url(:company)
    else
      @url = recommendations_url(:job)
    end
  end

  def set_connection_url(recommendation)
    if recommendation.company
      @url = connections_url(:company)
    else
      @url = connections_url(:job)
    end
  end


end
