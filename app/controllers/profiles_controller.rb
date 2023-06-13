class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy total_rating]

  def index
    @profiles = policy_scope(Profile)


    @markers = @profiles.geocoded.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        info_window_html: render_to_string(partial:
          "info_window", locals: {profile: profile}),
        image_url: helpers.asset_url("https://res.cloudinary.com/dfipoufmj/image/upload/v1685634376/light_bulb_moment_zpn95k.png")
      }
    end

    if params[:query].present?
      sql_subquery = <<~SQL
        profiles.name @@ :query
        OR profiles.title @@ :query
        OR profiles.how @@ :query
        OR profiles.why @@ :query
        OR profiles.what @@ :query
        OR profiles.address @@ :query
        OR profiles.advice @@ :query
        OR profiles.hours @@ :query
      SQL
      @profiles = @profiles.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @profile_data = {}
    @most_similar_profiles = []
    @profiles.each do |profile|
      user = User.find(profile.user_id)
      questionnaire = Questionnaire.where(user_id: current_user.id).first
      total_rating = total_rating(profile)
      if questionnaire.present?
        most_similar = find_most_similar_questionnaires(questionnaire)
      end
      @profile_data[profile.id] = {
        user: user,
        total_rating: total_rating,
        questionnaire: questionnaire,
        most_similar: most_similar
      }
      @most_similar_profiles << profile if most_similar.present?
      @most_similar_profiles = @most_similar_profiles.take(2) if @most_similar_profiles.size > 2

    end

  end

  def show
    authorize @profile
    @user = User.find(@profile.user_id)
    @total_rating = total_rating(@profile)
    @review = Review.new
  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def edit
    # @profile = Profile.where(user_id: current_user)
    authorize @profile

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    respond_to do |format|
      if @profile.save
        format.html { redirect_to new_profile_questionnaire_path(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @profile = Profile.where(user_id: current_user)

    authorize @profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to dashboard_path, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def total_rating(profile)
    @reviews = Review.where(profile_id: profile.id)
    sum_of_reviews = @reviews.sum(:rating).to_f
    total_reviews = @reviews.length.to_f
    @total_rating = total_reviews > 0 ? sum_of_reviews / @reviews.length : 0
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :hours, :title, :how,
                                    :why, :what, :advice, :photo,
                                    :address, :linked_in_url, :instagram_url)
  end

  def find_most_similar_questionnaires(questionnaire)
    scores = Questionnaire.where.not(id: questionnaire.id).map do |other_questionnaire|
      similarity_score = similarity_score(questionnaire, other_questionnaire)
      [similarity_score, other_questionnaire]
    end
    scores.sort!.reverse!
  end

  def similarity_score(a, b)
    total_deviation = [a.q1, a.q2, a.q3, a.q4, a.q5].zip([b.q1, b.q2, b.q3, a.q4, a.q5]).sum do |x, y|
      euclidean_distance(x, y)
    end
    total_deviation_percentage = (total_deviation.to_f / (a.attribute_names.size - 1) * 4) * 100
    100 - total_deviation_percentage
  end

  def euclidean_distance(a, b)
    (a - b).abs
  end
end
