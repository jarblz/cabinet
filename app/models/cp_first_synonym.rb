class CpFirstSynonym < ApplicationRecord
  belongs_to :competency
  belongs_to :first_synonym, class_name: "Competency"
end
