class Recommendation < ApplicationRecord
  enum status: [:initial, :recruiter_approved, :match]
  # inital=no approval, matched=recruiter and candidated approved

  belongs_to :candidate, class_name: "User"
  belongs_to :company, optional: true
  belongs_to :job_posting, optional: true

  def self.check_user_for_matches(user)
    # TODO: change job posting search to spatial query
    JobPosting.all.each do |job|
      score = user.fit_score(job)
      if score >= 0.8
        if !Recommendation.exists?(user, job)
          Recommendation.create(candidate: user, job_posting: job, score: score)
        else
          # TODO: maybe set recommendation created_at to time.now, so that rec will move to top of feed
        end
      end
    end
  end
end
