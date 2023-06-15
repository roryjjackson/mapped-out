class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @questionnaire = Questionnaire.where(user_id: current_user.id).first

    @profile = Profile.where(user_id: current_user.id).first

    @reviews = Review.where(profile_id: @profile.id)
    sum_of_reviews = @reviews.sum(:rating).to_f
    total_reviews = @reviews.length.to_f
    @total_rating = total_reviews > 0 ? sum_of_reviews / @reviews.length : "No reviews"
  end

  def about
  end
end
