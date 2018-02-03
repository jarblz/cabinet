class CpThirdSynonym < ApplicationRecord
  belongs_to :competency
  belongs_to :third_synonym, class_name: "Competency"
end
