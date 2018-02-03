class AddThirdCompetencySynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_third_synonyms do |t|
      t.references :competency, index: true, foreign_key: true
      t.references :third_synonym, index: true
    end
    add_foreign_key :cp_third_synonyms, :competencies, column: :third_synonym_id
    add_index :cp_third_synonyms, [:competency_id, :third_synonym_id], unique: true
  end

end
