class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :user_id, uniqueness: { scope: :profile_id, message: "has already submitted a review for this profile" }
end
