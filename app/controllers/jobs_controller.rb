class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  require "nokogiri"
  require "open-uri"
  require 'json'

  # GET /jobs or /jobs.json
  def index
    @jobs = policy_scope(Job)

    letters = ("A".."Z").to_a

    url = "https://www.planitplus.net/JobProfiles?letter=Y"
    # base_url = "https://www.planitplus.net/JobProfiles?letter=A"

    # letters.map do |letter|
      # url = base_url + letter

      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML.parse(html_file)

      @job_headings = []

      html_doc.search('.jobs-list').each do |element|
        @job_headings << element.text.strip
      end

      # do something
      # html_doc.search(".jobs-list").each do |element|
      #   # help me here
      #   @job_headings << element.text.strip
      # end
    # end

    # html_file = URI.open(url).read
    # html_doc = Nokogiri::HTML.parse(html_file)

    # @job_titles = []

    # html_doc.search(".jobs-list").each do |element|
    #   # help me here
    #   @job_titles << element.text.strip
    # end
  end

  # GET /jobs/1 or /jobs/1.json
  def show
    authorize @job

    api_key = 'AIzaSyBj0Zq-ad00BSLiPvcJqtpagSkB_f-x67g'
    base_url = 'https://www.googleapis.com/youtube/v3/search'
    # query = "day in the life of a stonemason"
    params = {
      q: @job.name,
      key: api_key
    }
    url = "#{base_url}?#{URI.encode_www_form(params)}"

    begin
      response = URI.open(url)
      data = JSON.parse(response.read)
      @video_urls = data["items"].map { |item| "https://www.youtube.com/embed/#{item['id']['videoId']}" }
      # return data
    rescue OpenURI::HTTPError => e
      puts "Error: #{e.message}"
      @video_urls = []
      # return nil
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name)
    end
end
