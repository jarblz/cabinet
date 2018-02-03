class CpSecondSynonym < ApplicationRecord
  belongs_to :competency
  belongs_to :second_synonym, class_name: "Competency"
end
