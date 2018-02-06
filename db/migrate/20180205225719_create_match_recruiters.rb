class CreateMatchRecruiters < ActiveRecord::Migration[5.0]
  def change
    create_table :match_recruiters do |t|
      t.integer :company_id
      t.integer :user_id
    end
  end
end
