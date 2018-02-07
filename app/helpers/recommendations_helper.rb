module RecommendationsHelper
  def user_photo_content(user)
    html = ""
    if user && user.photo.exists?
      html += image_tag user.photo.url(:thumb)
    elsif user
      html += "<div class='text'>"
      html += user.no_image_text
      html += "</div>"
    end

  end
end
