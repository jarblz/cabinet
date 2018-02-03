class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.integer :job_posting_id
      t.integer :company_id
      t.integer :user_id
      t.integer :status, default: 0
      t.decimal :score, default: 0.25
      t.boolean :recruiter_seen, default: false
      t.boolean :candidate_seen, default: false
    end
  end
end
