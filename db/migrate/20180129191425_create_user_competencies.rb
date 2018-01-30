class CreateUserCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_competencies do |t|
      t.integer :user_id
      t.integer :competency_id
    end
  end
end
