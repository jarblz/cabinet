class Company < ApplicationRecord
  has_many :company_traits
  has_many :traits, through: :company_traits
  has_many :recruiters, foreign_key: "company_id", class_name: "User"

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  # TODO: add maximum number of accounts when we want to begin monetizing

  before_save :generate_code

  enum status: [ :inactive, :active ]

  def generate_code
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Company.exists?(code: random_token)
    end
  end

end
