class JobPostingUser < ApplicationRecord
  belongs_to :job_posting
  belongs_to :user
end
