class AddSecondCompetencySynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_second_synonyms do |t|
      t.references :competency, index: true, foreign_key: true
      t.references :second_synonym, index: true
    end
    add_foreign_key :cp_second_synonyms, :competencies, column: :second_synonym_id
    add_index :cp_second_synonyms, [:competency_id, :second_synonym_id], unique: true
  end

end
