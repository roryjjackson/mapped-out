class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @profile = Profile.find(params[:profile_id])
    authorize @review

  end

  def create
    @profile = Profile.find(params[:profile_id])
    @review = Review.new(review_params)
    @review.profile_id = @profile.id
    @review.user_id = current_user
    authorize @review
    @review.user = current_user
    if @review.save
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
