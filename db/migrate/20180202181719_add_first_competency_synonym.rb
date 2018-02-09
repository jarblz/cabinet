class AddFirstCompetencySynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_first_synonyms do |t|
      t.references :competency, index: true, foreign_key: true
      t.references :first_synonym, index: true
      t.timestamps null: false
    end
    add_foreign_key :cp_first_synonyms, :competencies, column: :first_synonym_id
    add_index :cp_first_synonyms, [:competency_id, :first_synonym_id], unique: true
  end

end
