class Trait < ApplicationRecord
  has_many :company_traits
  has_many :companies, through: :company_traits
  has_many :user_traits
  has_many :users, through: :user_traits
  # TODO: add synonyms functionality (determine if needed)
  scope :recruiter_traits, -> { where(is_recruiter: true) }
  scope :candidate_traits, -> { where.not(is_recruiter: true)}

end
