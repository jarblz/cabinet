require 'httparty'

class JobPostingsController < ApplicationController
  before_action :set_company, only: [:company]
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy, :modal_content]
  before_action :confirm_recruiter, only: [:new, :edit, :update, :destroy]

  def company
    @job_postings = current_user.company.job_postings
  end

  def mine
    @job_postings = current_user.participating_jobs
  end

  def zip_jobs
    key = ENV['ZIPRECRUITER_API_KEY']
    base = ENV['ZIPRECRUITER_API_BASE']
    url = "#{base}?search=#{current_user.competencies.first.name || "business"}&location=#{current_user.address}&page=1&jobs_per_page=20&api_key=#{key}"
    response = HTTParty.get(URI.encode(url))
    response.parsed_response
    @job_postings = JSON.parse(response.body)['jobs']
  end

  def show
  end

  def new
    @job_posting = JobPosting.new(company: current_user.company, creator: current_user)
  end

  def edit
  end

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

  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to my_job_postings_url, notice: 'Job Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal_content
    html = render_to_string partial: 'modals/job_posting/show', locals: { job: @job_posting }
    respond_to do |format|
      format.json { render json: { html: html } }
    end
  end

  private

    def set_job_posting
      @job_posting = JobPosting.friendly.find(params[:id])
    end

    def set_company
      redirect_to dashboard_root_path, alert: 'no company specified!' if !params[:slug]
      @company = Company.friendly.find(params[:slug])
    end

    def confirm_recruiter
      redirect_to dashboard_root_path, alert: 'you must be a recruiter to see this page!' if !current_user.recruiter?
    end

    def job_posting_params
      params.require(:job_posting).permit(:title, :name, :description, :company_id, :creator_id, :remote, :zip_code, :address, trait_ids: [], competency_ids: [], user_ids: [])
    end
end
