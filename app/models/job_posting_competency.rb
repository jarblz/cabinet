class JobPostingCompetency < ApplicationRecord
  belongs_to :job_posting
  belongs_to :competency
end
