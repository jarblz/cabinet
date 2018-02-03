module ApplicationHelper
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
    if !user.active?
      {}
    elsif user.recruiter?
      {"Jobs": [my_job_postings_path, "#{'active' if controller?('job_postings')} right-most"],
        "Connections": [job_postings_path, "#{'active' if controller?('job_postings')&&action?('kewl')}"], #false
        "Messages": [job_postings_path, "#{'active' if controller?('job_postings')&&action?('kewl')}"] #false
      }
    else
      {"Jobs": [candidate_job_postings_path, "#{'active' if controller?('job_postings')}"],
        "Connections": [job_postings_path, "#{'active' if controller?('job_postings')&&action?('kewl')}"], #false
        "Messages": [job_postings_path, "#{'active' if controller?('job_postings')&&action?('kewl')}"] #false
      }
    end
  end

  def job_sub_links(user, job=nil)
    if !user.active?
      {}
    elsif user.recruiter?
      {"company jobs": [company_job_postings_path(current_user.company), "#{'active' if company_job?(user,job)}"],
        "my jobs": [my_job_postings_path, "#{'active' if my_job?(user,job)}"], #false
        "create job": [new_job_posting_path, "#{'active' if controller?('job_postings')&&action?('new')}"] #false
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
end
