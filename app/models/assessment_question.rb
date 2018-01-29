class AssessmentQuestion < ApplicationRecord
  enum format: [:forward, :reverse]

  def scores
    if self.forward?
      [3,2,1,-1,-2,-3]
    else
      [-3,-2,-1,1,2,3]
    end
  end
end
