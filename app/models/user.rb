class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
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
  has_many :recommendations, dependent: :delete_all
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :messages, dependent: :destroy
  # has_many :match_recruiters, class_name: 'MatchRecruiter', foreign_key: 'user_id'

  has_attached_file :resume
  has_attached_file :writing_sample
  has_attached_file :transcript
  has_attached_file :photo, styles: { large: "300x300#", medium: "200x200#", thumb: "120x120#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  enum felony: [ :yes, :no, :prefer_not_to_answer ]
  # enum gender: [ :male, :female, :other, :prefer_no_gender ]
  # enum race: [ :american_indian_or_alaska_native, :asian, :black_or_african_american, :native_hawaiian_or_other_pacific_islander, :white, :prefer_no_race ]
  # enum student_professional: [ :professional, :student, :other ]
  geocoded_by :address

  validates_presence_of :role, :on => :create
  validates_presence_of :name,          :on => :update
  validates_presence_of :email,         :on => :update
  validates_presence_of :phone,         :on => :update
  validates_inclusion_of :unvetted_matcher, in:[true, false], :on => :update
  validate :validate_traits_and_competencies, on: :update

  with_options if: :recruiter? do |recruiter|
    recruiter.validate :has_company
  end

  with_options if: :candidate? do |candidate|
    candidate.validates_presence_of :zip_code,  :on => :update
    candidate.validates_presence_of :address, on: :update
    candidate.validates_presence_of :felony,    :on => :update
    candidate.validates_inclusion_of :us_lawfully_authorized, in:[true, false], :on => :update
    candidate.validates_inclusion_of :require_sponsorship, in:[true, false],    :on => :update
    candidate.after_save :generate_recommendations
  end

  after_validation :geocode

  after_create :provision_role

  def validate_traits_and_competencies
    errors.add(:traits, "Please choose 5 personal, and 5 company") if traits.size != 10
    errors.add(:competencies, "Please choose 5") if competencies.size != 5
  end

  def provision_role
    self.grant(role)
  end

  def active?
    !no_recruiter_company? && profile_complete? && !personality.blank?
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

  def profile_complete?
    required = []
    required << !self.name.blank?
    required << !self.email.blank?
    required << !self.phone.blank?
    required << ([true,false].include? self.unvetted_matcher)
    required << self.traits.count == 10
    required << self.competencies.count == 5

    if candidate?
      required << !self.zip_code.blank?
      required << !self.felony.blank?
      required << ([true,false].include? self.us_lawfully_authorized)
      required << ([true,false].include? self.require_sponsorship)
    end
    eval required.join(" && ")
  end

  def self.valid_candidates(location=nil)
    # TODO: make this spatial
    User.all.select{ |u| u.candidate? && u.active? }
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

  def generate_recommendations
    # TODO: Add this to a worker, could take a while
    JobPosting.all.each do |job|
      Recommendation.generate_posting(job, self)
    end
    Company.all.each do |company|
      Recommendation.generate_company(company, self)
    end
  end

  def job_fit_score(job)
    score = 25.0
    score += Trait.score(job.traits, self.traits) * 50
    score += Competency.score(job.competencies, self.competencies) * 25
    score += experience_score(job)
    return score/Recommendation::JOB_FIT_POINTS
  end

  def experience_score(job)
    15.0
  end

  def company_fit_score(company)
    score = 25.0
    score+= Trait.score(company.traits, self.traits)*75
    score/Recommendation::COMPANY_FIT_POINTS
  end

  def company_traits
    traits.where(is_recruiter: true)
  end

  def personality_traits
    traits.where(is_recruiter: false)
  end

  def candidate_company_connections
    recommendations.select{ |r| r.match? && r.company }
  end

  def candidate_job_connections
    recommendations.select{ |r| r.match? && r.job_posting }
  end

  def candidate_job_recommendations
    recommendations.select{ |r| r.recruiter_approved? && r.job_posting }
  end

  def candidate_company_recommendations
    recommendations.select{ |r| r.recruiter_approved? && r.company }
  end

  def recruiter_job_recommendations
    Recommendation.recruiter_job_recommendations self
  end

  def recruiter_company_recommendations
    Recommendation.recruiter_company_recommendations self
  end

  def recruiter_job_connections
    Recommendation.recruiter_job_connections self
  end

  def recruiter_company_connections
    Recommendation.recruiter_company_connections self
  end

  def connections
    if self.recruiter?
      self.recruiter_job_connections + self.recruiter_company_connections
    else
      self.candidate_job_connections + self.candidate_company_connections
    end
  end

  private

  def has_company
    if !self.company # maybe do something smarter later, but this is fine for now
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



end
