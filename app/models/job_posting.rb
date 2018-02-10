class JobPosting < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: [ :inactive, :active ]
  has_many :job_posting_traits
  has_many :traits, through: :job_posting_traits

  has_many :job_posting_competencies
  has_many :competencies, through: :job_posting_competencies

  has_many :job_posting_users
  has_many :users, through: :job_posting_users

  has_many :recommendations, :dependent => :delete_all

  belongs_to :company

  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  # TODO: add maximum number of accounts when we want to begin monetizing

  validate :validate_traits_and_competencies
  validates_presence_of :title
  validates_presence_of :description
  validates_inclusion_of :remote, in:[true, false]
  validates_presence_of :zip_code, unless: :remote?

  after_save :generate_recommendations

  def validate_traits_and_competencies
    errors.add(:traits, "Please add at least 1") if traits.size == 0
    errors.add(:competencies, "Please add at least 1") if competencies.size == 0
  end

  def participants
    [creator] + users
  end

  def generate_recommendations
    User.valid_candidates.each do |candidate|
      Recommendation.generate_posting(self,candidate)
    end
  end


  def company_traits
    traits.where(is_recruiter: true)
  end

  def personality_traits
    traits.where(is_recruiter: false)
  end



  private


end
