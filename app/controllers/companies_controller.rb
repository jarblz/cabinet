class CompaniesController < ApplicationController
  before_action :set_company

  def modal_content
    respond_to do |format|
      format.json { render json: { html: CompanyModalHtml.show(@company) } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company

      @company = Company.friendly.find(params[:slug])
    end

end
