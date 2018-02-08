module JobModalHtml
  extend ActiveSupport::Concern
  def self.show(job)
    html = ""
    html += %(<div class="close-x" data-dismiss="modal" aria-label="Close">&Cross;</div>)
    html +=   %(<div class="row show-row">)
    html +=     %(<div class="col-sm-12">)
    html +=       %(<h2>#{job.title}</h2>)
    html +=     %(</div>)
    html +=   %(</div>)
    html +=   %(<div class="row show-row">)
    html +=     %(<div class="col-sm-6">)
    html +=       %(<div class="show-photo">)
    html +=         ActionController::Base.helpers.image_tag job.company.logo.url(:medium)
    html +=       %(</div>)
    html +=     %(</div>)
    html +=     %(<div class="col-sm-6">)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Competencies Required</div>)
    html +=             %(<p>)
    job.competencies.each do |c|
      html +=             %(<span>#{c.name}</span>)
    end
    html +=             %(</p>)
    html +=         %(</div>)
    html +=       %(</div>)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Company Culture</div>)
    html +=             %(<p>)
    job.company_traits.each do |t|
      html +=             %(<span>#{t.name}</span>)
    end
    html +=             %(</p>)
    html +=         %(</div>)
    html +=       %(</div>)
    html +=       %(<div class="row">)
    html +=         %(<div class="col-sm-12">)
    html +=           %(<div class='section-title'>Personality Traits</div>)
    html +=           %(<p>)
    job.personality_traits.each do |t|
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
    html +=       %(<div class='section-content'>#{job.zip_code}</div>)
    html +=     %(</div>)
    html +=   %(</div>)
    return html
  end

end
