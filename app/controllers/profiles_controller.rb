class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy total_rating]

  # GET /profiles or /profiles.json
  def index
    @profiles = policy_scope(Profile)

    @markers = @profiles.geocoded.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        info_window_html: render_to_string(partial:
          "info_window", locals: {profile: profile}),
        # image_url: helpers.asset_url("https://res.cloudinary.com/dfipoufmj/image/upload/v1669887491/Pngtree_location_vector_icon_4236431_a2leau.png")

        marker_html: render_to_string(partial: "marker", locals: {profile: profile})
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
    @profiles.each do |profile|
      user = User.find(profile.user_id)
      total_rating = total_rating(profile)
      @profile_data[profile.id] = {
        user: user,
        total_rating: total_rating
      }
    end
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    authorize @profile
    @user = User.find(@profile.user_id)
    @total_rating = total_rating(@profile)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    authorize @profile
  end

  # GET /profiles/1/edit
  def edit
    authorize @profile
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    authorize @profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
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
    # authorize @profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :hours, :title, :how, :why, :what, :advice, :photo, :address)
    end
end
