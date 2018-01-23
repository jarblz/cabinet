class Industry < ApplicationRecord
  has_many :candidate_industries
  has_many :candidates, through: :candidate_industries
  # TODO: add synonyms functionality (determine if needed)
  scope :recruiter_traits, -> { where(is_recruiter: true) }

  EXPERIENCE = {:intern => 'Intern Experience', "1_to_3" => '1-3 Years', "4_to_9" => '4-9 Years', "10_plus" => '10+ Years'}


end
