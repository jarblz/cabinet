class TraitSecondSynonym < ApplicationRecord
  belongs_to :trait
  belongs_to :second_synonym, class_name: "Trait"
end
