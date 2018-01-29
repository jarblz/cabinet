class AddNullFalseBackToJobCreator < ActiveRecord::Migration[5.0]
  def change
    change_column :job_postings, :creator_id, :integer, null: false
  end
end
