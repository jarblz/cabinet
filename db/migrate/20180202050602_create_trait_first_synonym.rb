class CreateTraitFirstSynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :trait_first_synonyms do |t|
      t.references :trait, index: true, foreign_key: true
      t.references :first_synonym, index: true
      t.timestamps null: false
    end
    add_foreign_key :trait_first_synonyms, :traits, column: :first_synonym_id
    add_index :trait_first_synonyms, [:trait_id, :first_synonym_id], unique: true
  end
end
