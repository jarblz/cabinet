class CreateJobPostingCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posting_competencies do |t|
      t.integer :job_posting_id,        null: false, default: ""
      t.integer :competency_id,         null: false, default: ""
      t.timestamps null: false
    end
  end
end
