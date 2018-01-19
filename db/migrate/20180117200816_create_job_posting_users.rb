class CreateJobPostingUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posting_users do |t|
      t.integer :job_posting_id,        null: false, default: ""
      t.integer :user_id,              null: false, default: ""
    end
  end
end
