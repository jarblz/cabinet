class AddAddressToJobPosting < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :address, :string
    add_column :job_postings, :latitude, :float
    add_column :job_postings, :longitude, :float
  end
end
