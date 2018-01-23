class User < ApplicationRecord
  rolify
  attr_accessor :role # allows us to set role in registration form
  attr_accessor :company_code

  NON_ADMIN_ROLES = { recruiter: 'Recruiter', candidate: 'Job Seeker' }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :job_posting_users
  has_many :job_postings, through: :job_posting_users
  has_many :created_jobs, foreign_key: "creator_id", class_name: "JobPosting"
  has_many :candidate_industries
  has_many :industries, through: :candidate_industries

  # TODO: traits relation (company and personal?)
  # TODO: competencies relation

  belongs_to :company # if candidate, this will always be nil

  enum felony: [ :yes, :no, :prefer_not_to_answer ]

  before_validation :join_company, :if => :company_code

  validates_presence_of :role, :on => :create
  validates_presence_of :name, :on => :update
  validates_presence_of :email, :on => :update
  validates_presence_of :phone, :on => :update
  validates_presence_of :zip_code, :on => :update
  validates_presence_of :country, :on => :update
  validates_presence_of :felony, :on => :update, if: :candidate?

  after_create :provision_role

  def provision_role
    self.grant(role)
  end

  def active?
    valid? && !no_candidate_assessment? && !no_recruiter_company?
  end

  def admin?
    has_role?(:admin)
  end

  def recruiter?
    has_role?(:recruiter)
  end

  def candidate?
    has_role?(:candidate)
  end

  def no_candidate_assessment?
    candidate? && true # !assessment
  end

  def no_recruiter_company?
    recruiter? && !company
  end

  def personality
    false
  end

  private

  def join_company
    if !Company.exists? code: self.company_code
      errors.add(:company_id, ": Invalid Code")
    elsif self.company
      errors.add(:company_id, ": You've already joined a company")
    elsif Company.find_by_code(self.company_code).at_account_limit?
      errors.add(:company_id, ": This company has reached it's account limit!")
    else
      self.company = Company.find_by_code(self.company_code)
    end
  end



end
