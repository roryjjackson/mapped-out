class MentorsController < ApplicationController
  before_action :set_mentor, only: %i[ show edit update destroy ]

  def index
    @mentors = policy_scope(Mentor)
  end

  def show
    authorize @mentor
  end

  def new
    @mentor = Mentor.new
    authorize @mentor
  end

  def edit
    authorize @mentor
  end

  def create
    @mentor = Mentor.new(mentor_params)
    authorize @mentor
    @mentor.user_id = current_user.id
    respond_to do |format|
      if @mentor.save
        format.html { redirect_to root_path, notice: "Thank you for applying with us, we will be in contact shortly!" }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to mentor_url(@mentor), notice: "Mentor was successfully updated." }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mentor.destroy

    respond_to do |format|
      format.html { redirect_to mentors_url, notice: "Mentor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  def mentor_params
    params.require(:mentor).permit(:first_name, :last_name, :email, :number, :occupation)
  end
end
