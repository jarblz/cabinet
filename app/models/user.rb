class User < ApplicationRecord
  rolify
  attr_accessor :role # allows us to set role in registration form
  attr_accessor :company_code

  NON_ADMIN_ROLES = { recruiter: 'Recruiter', candidate: 'Job Seeker' }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  belongs_to :company # if candidate, this will always be nil
  has_many :job_posting_users
  has_many :job_postings, through: :job_posting_users
  has_many :created_jobs, foreign_key: "creator_id", class_name: "JobPosting"
  has_many :candidate_industries
  has_many :industries, through: :candidate_industries
  belongs_to :personality
  has_one :assessment

  has_many :user_traits
  has_many :traits, through: :user_traits
  has_many :user_competencies
  has_many :competencies, through: :user_competencies

  has_attached_file :resume
  has_attached_file :writing_sample
  has_attached_file :transcript
  has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  enum felony: [ :yes, :no, :prefer_not_to_answer ]
  # enum gender: [ :male, :female, :other, :prefer_no_gender ]
  # enum race: [ :american_indian_or_alaska_native, :asian, :black_or_african_american, :native_hawaiian_or_other_pacific_islander, :white, :prefer_no_race ]
  # enum student_professional: [ :professional, :student, :other ]

  validates_presence_of :role, :on => :create

  with_options if: :recruiter? do |recruiter|
    recruiter.before_validation :join_company, :if => :company_code
    recruiter.validates_presence_of :name, :on => :update, unless: :company_code
    recruiter.validates_presence_of :email, :on => :update, unless: :company_code
    recruiter.validates_presence_of :phone, :on => :update, unless: :company_code
  end

  with_options if: :candidate? do |candidate|
    candidate.validates_presence_of :name, :on => :update
    candidate.validates_presence_of :email, :on => :update
    candidate.validates_presence_of :phone, :on => :update
    candidate.validates_presence_of :zip_code, :on => :update
    candidate.validates_presence_of :felony, :on => :update
    candidate.validates_inclusion_of :us_lawfully_authorized, in:[true, false], :on => :update
    candidate.validates_inclusion_of :require_sponsorship, in:[true, false], :on => :update
    candidate.validate :validate_traits_and_competencies
    candidate.after_save :check_for_matches
  end

  after_create :provision_role

  def validate_traits_and_competencies
    errors.add(:traits, "Please add at least 1") if traits.size == 0
    errors.add(:competencies, "Please add at least 1") if competencies.size == 0
  end

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
    candidate? && personality.blank?
  end

  def no_recruiter_company?
    recruiter? && (!company || company.inactive?)
  end

  def participating_jobs
    created_jobs + job_postings
  end

  def no_image_text
    if name
      if name.split(" ").count > 1
        "#{name.split(" ").first[0].upcase}#{name.split(" ").second[0].downcase}"
      elsif name.split('').count > 1
        "#{name.split('').first.upcase}#{name.split('').second.downcase}"
      else
        "#{name.split('').first.upcase}"
      end
    else
      "Me"
    end
  end

  def check_for_matches
    # TODO: Add this to a worker, could take a while
    Recommendation.check_user_for_matches(self)
  end

  def fit_score(job)
    binding.pry
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
