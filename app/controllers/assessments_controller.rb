class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:edit, :update]
  before_action :set_questions, only: [:edit]

  def edit

  end

  def update
    @assessment.add_scores(Assessment.gather_scores(params['question']))
    if @assessment.complete?
      redirect_to assessment_complete_path, notice: "Assessment Complete!"
    else
      redirect_to edit_assessment_path, notice: "Great! let's continue.."
    end
  end

  def show
  end

  def restart
    current_user.assessment.destroy
    current_user.attributes = { personality_id: nil }
    current_user.save(validate: false)
    redirect_to edit_assessment_path
  end

  private

  def set_assessment
    if !Assessment.exists? user_id: current_user.id
      @assessment = Assessment.create(user_id: current_user.id)
    else
      @assessment = Assessment.find_by_user_id(current_user.id)
    end
    redirect_to assessment_complete_path if @assessment.complete?
  end

  def set_questions
    @questions = AssessmentQuestion.where(page_number: @assessment.status)
  end
end
