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

  def self.score(target_competencies, matching_competencies)
    denominator = target_competencies.count
    score = 0.0
    score += (target_competencies & matching_competencies).count
    remaining = target_competencies - matching_competencies
    if denominator == 0
      0.0
    else
      remaining.each do |target_competency|
        matching_competencies.each do |matching_competency|
          if matching_competency.first_synonyms.include? target_competency
            score += 1
          elsif matching_competency.first_synonyms.include? target_competency
            score += 0.5
          elsif matching_competency.first_synonyms.include? target_competency
            score += 0.25
          end
        end
      end

      return score / denominator
    end
  end

end
