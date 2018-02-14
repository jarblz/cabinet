class CompaniesController < ApplicationController
  before_action :set_company

  def modal_content
    html = render_to_string partial: 'modals/company/show', locals: {company: @company}
    respond_to do |format|
      format.json { render json: { html: html } }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company

      @company = Company.friendly.find(params[:slug])
    end

end
