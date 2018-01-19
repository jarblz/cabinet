class AddProfileInformationToUser < ActiveRecord::Migration[5.0]
  def change
    # core fields
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :zip_code, :string
    add_column :users, :us_lawfully_authorized, :boolean
    add_column :users, :require_sponsorship, :boolean
    add_column :users, :felony, :integer
    # ansilliary fields
    add_attachment :users, :photo
    add_attachment :users, :resume
    add_attachment :users, :writing_sample
    add_attachment :users, :transcript
    add_column :users, :race, :integer
    add_column :users, :gender, :integer
    add_column :users, :student_professional, :integer
    add_column :users, :current_employer, :string
    add_column :users, :current_position, :string
    add_column :users, :website_url, :string
    add_column :users, :github_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :facebook_url, :string

  end
end
