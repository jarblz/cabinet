module AssessmentsHelper
  def assessment_submit_text(assessment)
    assessment.status == '5' ? 'Complete' : 'Continue'
  end

  def width_percentage(assessment)
    assessment.percent_complete == 0 ? 10 : assessment.percent_complete
  end
end
