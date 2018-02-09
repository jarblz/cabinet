class AddSecondTraitSynonym < ActiveRecord::Migration[5.0]
  def change
    create_table :trait_second_synonyms do |t|
      t.references :trait, index: true, foreign_key: true
      t.references :second_synonym, index: true
      t.timestamps null: false
    end
    add_foreign_key :trait_second_synonyms, :traits, column: :second_synonym_id
    add_index :trait_second_synonyms, [:trait_id, :second_synonym_id], unique: true
  end

end
