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
  geocoded_by :address

  validate :validate_traits_and_competencies
  validates_presence_of :title
  validates_presence_of :description
  validates_inclusion_of :remote, in:[true, false]
  validates_presence_of :zip_code, unless: :remote?
  validates_presence_of :address, unless: :remote?

  after_validation :geocode
  after_save :generate_recommendations

  def validate_traits_and_competencies
    errors.add(:traits, "Please choose 5 personal, and 5 company") if traits.size != 10
    errors.add(:competencies, "Please choose 5") if competencies.size != 5
  end

  def participants
    [creator] + users
  end

  def generate_recommendations
    User.valid_candidates.each do |candidate|
      Recommendation.generate_posting(self, candidate)
    end
  end


  def company_traits
    traits.where(is_recruiter: true)
  end

  def personality_traits
    traits.where(is_recruiter: false)
  end

  def participant?(user)
    participants.include? user
  end

  private


end
