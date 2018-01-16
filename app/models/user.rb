class User < ApplicationRecord
  rolify
  attr_accessor :role # allows us to set role in registration form
  NON_ADMIN_ROLES = {recruiter: 'Recruiter', candidate: 'Job Seeker'}

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role, :on => :create

  after_create :provision_role

  def provision_role
    self.grant(role)
  end

  def active?
    if recruiter?
      ( has_company_code? && profile_complete? )
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

  def candidate?
    has_role?(:candidate)
  end

  def has_company_code?
    true
  end

  def profile_complete?
    true
  end

  def assessment_complete?
    false
  end

end
