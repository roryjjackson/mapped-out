class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[show edit update destroy]

  def total_score
    @questionnaire = Questionnaire.find(params[:id])
    authorize @questionnaire
  end

  def index
    @questionnaires = policy_scope(Questionnaire)
  end

  def show
    authorize @questionnaire
  end

  def new
    @questionnaire = Questionnaire.new
    @questions = Questionnaire.all_questions
    authorize @questionnaire
  end

  def edit
    @questions = Questionnaire.all_questions
    authorize @questionnaire

  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user
    authorize @questionnaire
    @most_similar = find_most_similar_questionnaires(@questionnaire)
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to dashboard_path, notice: "Thank you for completing the test." }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @questionnaire

    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to dashboard_path, notice: "Your test scores have been updated." }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @questionnaire

    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Test scores deleted." }
      format.json { head :no_content }
    end
  end

  private

  def find_most_similar_questionnaires(questionnaire)
    scores = Questionnaire.where.not(id: questionnaire.id).map do |other_questionnaire|
      similarity_score = similarity_score(questionnaire, other_questionnaire)
      [similarity_score, other_questionnaire]
    end

    scores.sort!.reverse!
    scores.first(1)
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19, :q20, :q21, :q22, :q23, :q24, :q25)
  end

  def euclidean_distance(a, b)
    (a - b).abs
  end

  def similarity_score(a, b)
    total_deviation = [a.q1, a.q2, a.q3, a.q4, a.q5, a.q6, a.q7, a.q8, a.q9, a.q10,a.q11, a.q12, a.q13, a.q14, a.q15,a.q16, a.q17, a.q18, a.q19, a.q20,a.q21, a.q22, a.q23, a.q24, a.q25]
    .zip([b.q1, b.q2, b.q3, b.q4, b.q5, b.q6, b.q7, b.q8, b.q9, b.q10,b.q11, b.q12, b.q13, b.q14, b.q15,b.q16, b.q17, b.q18, b.q19, b.q20,b.q21, b.q22, b.q23, b.q24, b.q25]).sum do |x, y|
      euclidean_distance(x, y)
    end
    total_deviation_percentage = (total_deviation.to_f / (a.attribute_names.size - 1) * 4) * 100
    100 - total_deviation_percentage
  end
end
