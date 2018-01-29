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

  belongs_to :company

  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  # TODO: add maximum number of accounts when we want to begin monetizing

  validate :validate_traits_and_competencies
  validates_presence_of :title
  validates_presence_of :description

  def validate_traits_and_competencies
    errors.add(:traits, "Please add at least 1") if traits.size == 0
    errors.add(:competencies, "Please add at least 1") if competencies.size == 0
  end

  def participants
    [creator] + users
  end

  private


end
