class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[show edit update destroy]
  before_action :set_profile, only: %i[show new create update edit]

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
    authorize @questionnaire
  end

  def edit
    authorize @questionnaire
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user
    @questionnaire.profile_id = @profile.id
    authorize @questionnaire
    @most_similar = find_most_similar_questionnaires(@questionnaire)
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to profile_questionnaire_url(@profile, @questionnaire), notice: "Questionnaire was successfully created." }
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
        format.html { redirect_to dashboard_path, notice: "Questionnaire was successfully updated." }
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
      format.html { redirect_to dashboard_path, notice: "Questionnaire was successfully destroyed." }
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


  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:q1, :q2, :q3, :q4, :q5, :profile_id)
  end

  def euclidean_distance(a, b)
    (a - b).abs
  end

  def similarity_score(a, b)
    total_deviation = [a.q1, a.q2, a.q3, a.q4, a.q5].zip([b.q1, b.q2, b.q3, a.q4, a.q5]).sum do |x, y|
      euclidean_distance(x, y)
    end
    total_deviation_percentage = (total_deviation.to_f / (a.attribute_names.size - 1) * 4) * 100
    100 - total_deviation_percentage
  end
end
