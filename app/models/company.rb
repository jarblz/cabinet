class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum status: [ :inactive, :active ]

  has_many :company_traits
  has_many :traits, through: :company_traits
  has_many :recruiters, foreign_key: "company_id", class_name: "User"
  has_many :job_postings

  has_attached_file :logo, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :logo
  validates_presence_of :name
  validates_presence_of :contact_email
  validates_presence_of :phone
  validates_presence_of :account_limit
  validates_presence_of :bio
  validates_presence_of :status

  before_save :generate_code
  after_save :generate_recommendations

  def generate_code
    self.code = loop do
      random_token = SecureRandom.hex(8)
      break random_token unless Company.exists?(code: random_token)
    end
  end

  def at_account_limit?
    self.recruiters.count == account_limit
  end

  def generate_recommendations
    User.candidates.each do |user|
      Recommendation.generate_company(company, user)
    end
  end

end
