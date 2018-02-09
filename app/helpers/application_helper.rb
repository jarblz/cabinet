module ApplicationHelper

  def percentize(number)
    number_to_percentage(number*100, precision: 0).split('%').first
  end

  def time_ago(timestamp)
    "#{((Time.now-timestamp)/60/60/24).to_i} Days Ago"
  end

  def avatar_contents
    html = ""
    if current_user && current_user.photo.exists?
      html += image_tag current_user.photo.url(:thumb), width: '30px', class: 'dropdown-trigger'
    elsif current_user
      html += "<div class='text dropdown-trigger'>"
      html += current_user.no_image_text
      html += "</div>"
    end
  end

  def quicklinks(user)
    if !user || !user.active?
      {}
    else
      {
        "Jobs": [path_for_job_landing(user), "#{'active' if controller?('job_postings')} right-most"],
        "Connections": [connections_path(:job), "#{'active' if controller?('recommendations')}"]
        # "Messages": [job_postings_path, "#{'active' if controller?('job_postings')&&action?('kewl')}"] #false
      }
    end
  end

  def job_sub_links(user, job=nil)
    {
      "company jobs": [company_job_postings_path(current_user.company), "#{'active' if company_job?(user,job)}"],
      "my jobs": [my_job_postings_path, "#{'active' if my_job?(user,job)}"], #false
      "create job": [new_job_posting_path, "#{'active' if controller?('job_postings')&&action?('new')}"] #false
    }
  end

  def connection_sub_links(user)
    {
      "connections": [connections_path(:job), "#{'active' if controller?('recommendations')&&action?('connections')}"],
      "recommendations": [recommendations_path(:job), "#{'active'  if controller?('recommendations')&&action?('recommendations')}"]
    }
  end

  def vetted_unvetted_sub_links(user)
    if controller?('recommendations')&&action?('connections')
      {
        "Job": [connections_path(:job), "#{'active' if params[:type]=='job'}"],
        "#": [recommendations_path(:company), "middle"], # hacky divider
        "Company": [connections_path(:company), "#{'active' if params[:type]=='company'}"]
      }
    elsif controller?('recommendations')&&action?('recommendations')
      {
        "Job": [recommendations_path(:job), "#{'active' if params[:type]=='job'}"],
        "#": [recommendations_path(:company), "middle"], # hacky divider
        "Company": [recommendations_path(:company), "#{'active' if params[:type]=='company'}"]
      }
    end
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def my_job?(user, job=nil)
    controller?('job_postings')&&action?('mine') || (job && job.try(:creator) == current_user)
  end

  def company_job?(user, job=nil)
    controller?('job_postings')&&action?('company') || (job && job.try(:creator) != current_user)
  end

  def path_for_job_landing(user)
    if user.recruiter?
      my_job_postings_path
    else
      candidate_job_postings_path
    end
  end

end
