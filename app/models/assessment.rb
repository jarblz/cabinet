class Assessment < ApplicationRecord
  belongs_to :user
  enum status: [:complete, :"1", :"2", :"3", :"4", :"5"]
  before_create :set_page, :set_score

  AVATAR_CATEGORIES = [ :ie, :vn, :sm, :oa ]

  def percent_complete
    if self.complete?
      return 100
    elsif self.status == "1"
      return 0
    else
      ((self.status.to_f/(Assessment.pages.count+1).to_f)*100).to_s.split(".")[0].to_i
    end
  end

  def add_scores(params)
    params.keys.each do |k|
      self[k] += params[k]
    end
    if Assessment.statuses[self.status] == Assessment.pages.count
      new_status = 0
      self.user.update(personality: Personality.find_by_scores(self))
    else
      new_status = Assessment.statuses[self.status]+1
    end
    params[:status] = new_status
    self.update(params)
  end

  def categories
    Assessment::CATEGORIES
  end

  def self.pages
    return Assessment.statuses.drop(1)
  end

  def self.gather_scores(scores)
    update_params = Assessment.base_score
    scores.keys.each do |n|
      update_params[AssessmentQuestion.find(n.to_i).category.to_s.downcase.to_sym] += scores[n].to_i
    end
    return update_params
  end

  def self.base_score
    {ie: 0, vn: 0, sm: 0, pt: 0, oa: 0}
  end

  private


  def set_page
    self.status = 1
  end

  def set_score
    self.assign_attributes(Assessment.base_score)
  end

end
