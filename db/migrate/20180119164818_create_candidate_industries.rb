class CreateCandidateIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_industries do |t|
      t.integer :user_id
      t.integer :industry_id
      t.string :experience
    end
  end
end
