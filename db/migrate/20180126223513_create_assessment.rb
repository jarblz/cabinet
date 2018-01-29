class CreateAssessment < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.integer :status,
      t.integer :ie, default: 0
      t.integer :vn, default: 0
      t.integer :oa, default: 0
      t.integer :sm, default: 0
      t.integer :pt, default: 0
    end
  end
end
