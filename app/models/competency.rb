class Competency < ApplicationRecord
  has_many :job_posting_competencies
  has_many :job_postings, through: :job_posting_competencies

end
