class CreateJobPostings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_postings do |t|
      t.integer :creator_id,        null: false
      t.integer :company_id,        null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
