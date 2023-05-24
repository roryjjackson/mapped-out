class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @questionnaire = Questionnaire.where(user_id: current_user.id)
    # raise
    # @data = {}
    # @questionnaires.each do |questionnaire|
    #   user = User.find(questionnaire.user_id)
    #   total_score = questionnaire.total_score
    #   @questionnaire_data[questionnaire.id] = {
    #     user: user,
    #     total_score: total_score
    #   }
    # end
  end
end
