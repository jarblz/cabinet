class Recommendation < ApplicationRecord
  enum status: [:initial, :recruiter_approved, :match]
  # inital=no approval, matched=recruiter and candidated approved

  belongs_to :candidate, class_name: "User", :foreign_key => "user_id"
  belongs_to :company, optional: true
  belongs_to :job_posting, optional: true

  JOB_FIT_POINTS = 125.0
  COMPANY_FIT_POINTS = 25.0

  def self.generate_posting(job, user)
    score = user.job_fit_score(job)
    if score >= 0.8
      if !Recommendation.exists?(candidate: user, job_posting: job)
        Recommendation.create(candidate: user, job_posting: job, score: score)
      else
        Recommendation.find_by(candidate: user, job_posting: job).update(score: score)
      end
    end
  end

  def self.generate_company(company, user)
    score = user.company_fit_score(company)
    if score >= 0.8
      if !Recommendation.exists?(candidate: user, company: company)
        Recommendation.create(candidate: user, company: company, score: score)
      else
        Recommendation.find_by(candidate: user, company: company).update(score: score)
      end
    end
  end

  def type
    if company?
      :company
    else
      :job
    end
  end

end
