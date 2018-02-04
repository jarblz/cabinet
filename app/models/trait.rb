class Trait < ApplicationRecord
  has_many :company_traits
  has_many :companies, through: :company_traits
  has_many :user_traits
  has_many :users, through: :user_traits

  has_many :trait_first_synonyms
  has_many :first_synonyms, through: :trait_first_synonyms

  has_many :trait_second_synonyms
  has_many :second_synonyms, through: :trait_second_synonyms

  has_many :trait_third_synonyms
  has_many :third_synonyms, through: :trait_third_synonyms

  # TODO: add synonyms functionality (determine if needed)
  scope :recruiter_traits, -> { where(is_recruiter: true) }
  scope :candidate_traits, -> { where.not(is_recruiter: true)}


  def self.score(target_traits, matching_traits)
    denominator = target_traits.count
    score = 0.0
    score += (target_traits & matching_traits).count
    remaining = target_traits - matching_traits
    if denominator == 0
      0.0
    else
      remaining.each do |target_trait|
        matching_traits.each do |matching_trait|
          if matching_trait.first_synonyms.include? target_trait
            score += 1
          elsif matching_trait.first_synonyms.include? target_trait
            score += 0.5
          elsif matching_trait.first_synonyms.include? target_trait
            score += 0.25
          end
        end
      end

      return score / denominator
    end
  end


end
