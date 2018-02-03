class TraitFirstSynonym < ApplicationRecord
  belongs_to :trait
  belongs_to :first_synonym, class_name: "Trait"
end
