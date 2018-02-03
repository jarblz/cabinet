require 'httparty'

class JobPostingsController < ApplicationController
  before_action :set_company, only: [:company]
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  before_action :confirm_recruiter, only: [:new, :edit, :update, :destroy]

  # GET /job_postings
  # GET /job_postings.json
  def company
    @job_postings = current_user.company.job_postings
    # TODO: candidate: populate with ziprecruiter API
  end

  # GET /job_postings
  # GET /job_postings.json
  def mine
    @job_postings = current_user.participating_jobs
    # TODO: candidate: populate with ziprecruiter API
  end

  def zip_jobs
    key = ENV['ZIPRECRUITER_API_KEY']
    base = ENV['ZIPRECRUITER_API_BASE']
    url = "#{base}?search=#{current_user.competencies.first.name || "business"}&location=#{current_user.zip_code}&page=1&jobs_per_page=20&api_key=#{key}"
    response = HTTParty.get(URI.encode(url))
    response.parsed_response
    @job_postings = JSON.parse(response.body)['jobs']
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new(company: current_user.company, creator: current_user)
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)
    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to my_job_postings_path, notice: 'Job Posting was successfully created.' }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to my_job_postings_path, notice: 'Job Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to my_job_postings_url, notice: 'Job Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.friendly.find(params[:id])
    end

    def set_company
      redirect_to root_path, alert: 'no company specified!' if !params[:slug]
      @company = Company.friendly.find(params[:slug])
    end

    def confirm_recruiter
      redirect_to root_path, alert: 'you must be a recruiter to see this page!' if !current_user.recruiter?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :name, :description, :company_id, :creator_id, :remote, :zip_code, trait_ids: [], competency_ids: [], user_ids: [])
    end
end
