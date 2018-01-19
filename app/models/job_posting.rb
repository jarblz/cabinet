class JobPosting < ApplicationRecord
  has_many :job_posting_traits
  has_many :traits, through: :job_posting_traits
  has_many :job_posting_competencies
  has_many :competencies, through: :job_posting_competencies
  has_many :job_posting_users
  has_many :users, through: :job_posting_users
  belongs_to :company
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"

  # TODO: add maximum number of accounts when we want to begin monetizing

  after_create :add_creator_to_participants

  enum status: [ :inactive, :active ]

  private

  def add_creator_to_participants
    if !users.include? creator
      self.users << creator
    end
  end

end
