module UserModalHtml
  extend ActiveSupport::Concern
  def self.show(user)
    html = ""
    html += %(<div class="close-x" data-dismiss="modal" aria-label="Close">&Cross;</div>)
    html +=   %(<div class="row show-row">)
    html +=     %(<div class="col-sm-12">)
    html +=       %(<h2>#{user.name}</h2>)
    html +=     %(</div>)
    html +=   %(</div>)
    html +=   %(<div class="row show-row">)
    html +=     %(<div class="col-sm-6">)
    html +=       %(<div class="show-photo">)
    if user && user.photo.exists?
      html +=       ActionController::Base.helpers.image_tag user.photo.url(:medium)
    elsif user
      html +=       "<div class='text'>"
      html +=         user.no_image_text
      html +=       "</div>"
    end
    html +=       %(</div>)
    html +=     %(</div>)
    html +=     %(<div class="col-sm-6">)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Competencies</div>)
    html +=             %(<p>)
    user.competencies.each do |c|
      html +=             %(<span>#{c.name}</span>)
    end
    html +=             %(</p>)
    html +=         %(</div>)
    html +=       %(</div>)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Desired Company Traits</div>)
    html +=             %(</p>)
    user.company_traits.each do |t|
      html +=             %(<span>#{t.name}</span>)
    end
    html +=             %(</p>)
    html +=         %(</div>)
    html +=       %(</div>)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Personality Traits</div>)
    html +=           %(<p>)
    user.personality_traits.each do |t|
      html +=           %(<span>#{t.name}</span>)
    end
    html +=           %(</p>)
    html +=         %(</div>)
    html +=       %(</div>)
    html +=     %(</div>)
    html +=   %(</div>)
    html +=   %(<div class="divider"></div>)
    html +=   %(<div class="row show-row full">)
    html +=     %(<div class="col-sm-12">)
    html +=       %(<div class='section-title'>Location</div>)
    html +=       %(<div class='section-content'>#{user.zip_code}</div>)
    html +=     %(</div>)
    html +=     %(<div class="col-sm-12">)
    html +=       %(<div class='section-title'>Documents</div>)
    html +=       %(<ul class='section-content'>)
    html +=         self.user_documents_list(user)
    html +=       %(</ul>)
    html +=     %(</div>)
    html +=   %(</div>)
    return html
  end

  def self.user_documents_list(user)
    html = ""
    if !user.resume.exists? && !user.writing_sample.exists? && !user.transcript.exists?
      html += "<li>None Provided</li>"
    else
      if user.resume.exists?
        html += %(<li>#{ActionController::Base.helpers.link_to("#{user.name}'s Resume",user.resume.url)}</li>)
      elsif user.writing_sample.exists?
        html += %(<li>#{ActionController::Base.helpers.link_to(
          "#{user.name}'s Writing Sample",
          user.resume.url)}</li>)
      elsif user.transcript.exists?
        html += %(<li>#{ActionController::Base.helpers.link_to(
          "#{user.name}'s Transcript",
          user.resume.url)}</li>)
      end
    end
    return html
  end
end
