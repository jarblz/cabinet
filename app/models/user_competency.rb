class UserCompetency < ApplicationRecord
  belongs_to :user
  belongs_to :competency
end
