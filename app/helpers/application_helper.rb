module ApplicationHelper
  def avatar_contents
    html = ""
    if current_user && current_user.photo.exists?
      html += image_tag user.photo.url(:thumb), width: '30px'
    elsif current_user
      html += "<div class='text dropdown-trigger'>"
      html += no_image_text
      html += "</div>"
    end
  end

  def no_image_text
    if current_user.name
      if current_user.name.split(" ").count > 1
        "#{current_user.name.split(" ").first[0].upcase}#{current_user.name.split(" ").second[0].downcase}"
      elsif current_user.name.split('').count > 1
        "#{current_user.name.split('').first.upcase}#{current_user.name.split('').first.downcase}"
      else
        "#{current_user.name.split('').first.upcase}"
      end
    else
      "Me"
    end
  end
end
