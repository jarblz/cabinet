class AddLocationAndRemoteToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :remote, :boolean
    add_column :job_postings, :zip_code, :string
  end
end
