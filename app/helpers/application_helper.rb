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
end
