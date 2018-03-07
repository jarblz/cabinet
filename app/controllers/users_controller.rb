class UsersController < ApplicationController
  before_action :set_user, except: [:modal_content]
  before_action :set_user_by_id, only: [:modal_content]

  # # GET /users/1
  # # GET /users/1.json
  # def show
  # end

  # GET /core_info
  def core_info
  end

  def edit_recruiter_code
  end

  def assessment

  end

  def modal_content
    html = render_to_string partial: 'modals/user/show', locals: {user: @user, viewer: current_user}
    respond_to do |format|
      format.json { render json: { html: html } }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to dashboard_root_path, notice: 'Your information has been updated!' }
        # format.json { render :, status: :ok, location: @user }
      else
        format.html { render :core_info }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def connection_list_modal_content
    html = render_to_string partial: 'modals/user/connections/list', locals: { user: current_user }
    respond_to do |format|
      format.json { render json: { html: html } }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_user_by_id
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :email, :phone, :country, :zip_code, :address, :company_code, :remote, :felony, :us_lawfully_authorized, :unvetted_matcher,
        :require_sponsorship, :photo, :resume, :writing_sample, :transcript, trait_ids: [], competency_ids: [])
    end
end
