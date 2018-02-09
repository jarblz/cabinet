class AddThirdTraitSynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :trait_third_synonyms do |t|
      t.references :trait, index: true, foreign_key: true
      t.references :third_synonym, index: true
      t.timestamps null: false
    end
    add_foreign_key :trait_third_synonyms, :traits, column: :third_synonym_id
    add_index :trait_third_synonyms, [:trait_id, :third_synonym_id], unique: true
  end

end
