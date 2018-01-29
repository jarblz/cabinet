class CreateAssessmentQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_questions do |t|
      t.string :category, null: false
      t.string :question, null: false
      t.string :page_number, null: false
      t.integer :format, null: false, default: 0
    end
  end
end
