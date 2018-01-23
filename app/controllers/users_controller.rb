class UsersController < ApplicationController
  before_action :set_user

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

  def link_recruiter_company
    if @user.update(company_code: params[:company_code])
      redirect_to root_path, notice: "You're now part of the #{@user.company.name} organization."
    else
      redirect_to root_path, alert: "Oops! #{@user.errors.full_messages.to_sentence}"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'Your information has been updated!' }
        # format.json { render :, status: :ok, location: @user }
      else
        if params[:name]
          format.html { render :core_info }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        elsif params[:industry_ids]
          format.html { render :assessment }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :country, :zip_code, :felony, :us_lawfully_authorized, :require_sponsorship)
    end
end
