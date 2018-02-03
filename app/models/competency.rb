class Competency < ApplicationRecord
  has_many :job_posting_competencies
  has_many :job_postings, through: :job_posting_competencies

  has_many :user_competencies
  has_many :users, through: :user_competencies

  has_many :cp_first_synonyms
  has_many :first_synonyms, through: :cp_first_synonyms

  has_many :cp_second_synonyms
  has_many :second_synonyms, through: :cp_second_synonyms

  has_many :cp_third_synonyms
  has_many :third_synonyms, through: :cp_third_synonyms


end
