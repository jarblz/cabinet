class TraitThirdSynonym < ApplicationRecord
  belongs_to :trait
  belongs_to :third_synonym, class_name: "Trait"
end
