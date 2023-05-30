class Questionnaire < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :user_id, uniqueness: true
end
