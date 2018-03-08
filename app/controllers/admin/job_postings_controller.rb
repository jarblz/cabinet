module Admin
  class JobPostingsController < ApplicationController
    before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
    before_action :set_company, only: [:new]

    # GET /job_postings
    # GET /job_postings.json
    def index
      @job_postings = JobPosting.all
    end

    # GET /job_postings/1
    # GET /job_postings/1.json
    def show
    end

    # GET /job_postings/new
    def new
      @job_posting = JobPosting.new(company: Company.friendly.find(params[:name]), creator: current_user)
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
          format.html { redirect_to admin_job_posting_path(@job_posting), notice: 'Job Posting was successfully created.' }
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
          format.html { redirect_to admin_job_posting_path(@job_posting), notice: 'Job Posting was successfully updated.' }
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
        format.html { redirect_to admin_job_postings_url, notice: 'Job Posting was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private


      # Use callbacks to share common setup or constraints between actions.
      def set_job_posting
        @job_posting = JobPosting.friendly.find(params[:id])
      end

      def set_company
        redirect_to root_path, alert: 'no company specified!' if !params[:name]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def job_posting_params
        params.require(:job_posting).permit(:title, :name, :description, :company_id, :creator_id, trait_ids: [], competency_ids: [], user_ids: [])
      end
  end
end
