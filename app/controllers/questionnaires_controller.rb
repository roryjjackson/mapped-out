class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[ show edit update destroy ]

  def total_score
    @questionnaire = Questionnaire.find(params[:id])
    authorize @questionnaire
  end

  # GET /questionnaires or /questionnaires.json
  def index
    @questionnaires = policy_scope(Questionnaire)
  end

  # GET /questionnaires/1 or /questionnaires/1.json
  def show
    authorize @questionnaire
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
    authorize @questionnaire
  end

  # GET /questionnaires/1/edit
  def edit
    authorize @questionnaire
  end

  # POST /questionnaires or /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user
    total = @questionnaire.q1 + @questionnaire.q2 + @questionnaire.q3 + @questionnaire.q4 + @questionnaire.q5
    @total_score = (total.to_f / 500) * 100
    @questionnaire.total_score = @total_score
    authorize @questionnaire
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaire_url(@questionnaire), notice: "Questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1 or /questionnaires/1.json
  def update
    authorize @questionnaire

    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to questionnaire_url(@questionnaire), notice: "Questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1 or /questionnaires/1.json
  def destroy
    authorize @questionnaire

    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: "Questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionnaire_params
      params.require(:questionnaire).permit(:q1, :q2, :q3, :q4, :q5)
    end
end
