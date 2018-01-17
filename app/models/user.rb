class User < ApplicationRecord
  rolify
  attr_accessor :role # allows us to set role in registration form
  NON_ADMIN_ROLES = {recruiter: 'Recruiter', candidate: 'Job Seeker'}
  belongs_to :company

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role, :on => :create

  after_create :provision_role

  def provision_role
    self.grant(role)
  end

  def active?
    if recruiter?
      ( company && profile_complete? )
    else
      ( profile_complete? && assessment_complete? )
    end

  end

  def admin?
    has_role?(:admin)
  end

  def recruiter?
    has_role?(:recruiter)
  end

  def company_recruiter?
    company && recruiter?
  end

  def candidate?
    has_role?(:candidate)
  end

  def profile_complete?
    false
  end

  def assessment_complete?
    false
  end

  def link_company(company_code)
    update(company: Company.find_by_code(company_code))
  end

end
