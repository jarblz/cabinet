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

end
