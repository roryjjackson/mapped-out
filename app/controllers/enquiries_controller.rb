class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[new create]

  # GET /enquiries or /enquiries.json
  def index
    @enquiries = Enquiry.all
    @profiles = policy_scope(Profile)

  end

  # GET /enquiries/1 or /enquiries/1.json
  def show
    @enquiry = Enquiry.find(params[:id])
    authorize @enquiry
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
    authorize @enquiry
  end

  # GET /enquiries/1/edit
  def edit
  end

  # POST /enquiries or /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)
    authorize @enquiry


    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to root_path, notice: "Enquiry was successfully created." }
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquiries/1 or /enquiries/1.json
  def update
    respond_to do |format|
      if @enquiry.update(enquiry_params)
        format.html { redirect_to enquiry_url(@enquiry), notice: "Enquiry was successfully updated." }
        format.json { render :show, status: :ok, location: @enquiry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1 or /enquiries/1.json
  def destroy
    authorize @enquiry

    @enquiry.destroy

    respond_to do |format|
      format.html { redirect_to admin_path, notice: "Enquiry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquiry_params
      params.require(:enquiry).permit(:email, :first_name, :last_name, :message)
    end
end
