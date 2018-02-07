class CompaniesController < ApplicationController
  before_action :set_company

  # GET /core_info
  def modal_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @user = Company.friendly.find(:slug)
    end

end
