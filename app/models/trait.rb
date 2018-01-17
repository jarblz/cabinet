class Trait < ApplicationRecord
  has_many :company_traits
  has_many :companies, through: :company_traits
  # TODO: add synonyms functionality (determine if needed)
  scope :recruiter_traits, -> { where(is_recruiter: true) }

end
