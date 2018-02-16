class Recommendation < ApplicationRecord
  enum status: [:initial, :recruiter_approved, :match, :denied]
  # inital=no approval, matched=recruiter and candidated approved

  belongs_to :candidate, class_name: "User", :foreign_key => "user_id"
  belongs_to :company, optional: true
  belongs_to :job_posting, optional: true
  has_many :conversations, class_name: 'Conversation', foreign_key: 'connection_id', dependent: :destroy


  scope :jobs, -> { where.not(job_posting: nil) }
  scope :companies, -> { where.not(company: nil) }

  after_create :notify_recommendation_recruiter
  after_save :recommendation_notifications, if: :status_changed?

  JOB_FIT_POINTS = 125.0
  COMPANY_FIT_POINTS = 100.0

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
    if !company.unvetted_matchers.blank?
      score = user.company_fit_score(company)
      if score >= 0.8
        if !Recommendation.exists?(candidate: user, company: company)
          Recommendation.create(candidate: user, company: company, score: score)
        else
          Recommendation.find_by(candidate: user, company: company).update(score: score)
        end
      end
    end
  end

  def approve(role)
    if role == :recruiter
      recruiter_approved!
    else
      match!
    end
  end

  def deny(role)
    denied!
  end

  def type
    if company
      :company
    else
      :job
    end
  end

  def recruiter
    if company
      company.unvetted_matchers.first
    else
      job_posting.creator
    end
  end

  def matching_traits
    if company
      candidate.traits && company.traits
    else
      candidate.traits && job_posting.traits
    end
  end

  def message_receiver(current_user)
    if current_user.recruiter?
      return self.candidate
    else
      self.recruiter
    end
  end

  def self.recruiter_job_recommendations(user)
    Recommendation.jobs.select{|r| r.job_posting.participants.include?(user) && r.initial?}
  end

  def self.recruiter_company_recommendations(user)
    if user.unvetted_matcher?
      Recommendation.companies.select{|r| r.company.recruiters.include?(user) && r.initial?}
    else
      []
    end
  end

  def self.recruiter_job_connections(user)
    Recommendation.jobs.select{|r| r.job_posting.participants.include?(user) && r.match?}
  end

  def self.recruiter_company_connections(user)
    if user.unvetted_matcher?
      Recommendation.companies.select{|r| r.company.recruiters.include?(user) && r.match?}
    else
      []
    end
  end

  def notify_recommendation_recruiter
    RecommendationMailer.recruiter_recommendation(self).deliver_now!
  end

  def recommendation_notifications
    if recruiter_approved?
      RecommendationMailer.candidate_recommendation(self).deliver_now!
    elsif match?
      RecommendationMailer.recruiter_match(self).deliver_now!
    end
  end

  def company_logo
    if self.company
      self.company.logo.url(:medium)
    else
      self.job_posting.company.logo.url(:medium)
    end
  end

  def conversation_text
    if self.company
      "Company Match: #{self.company.name}"
    else
      self.job_posting.title
    end
  end

end
