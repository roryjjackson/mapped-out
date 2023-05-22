class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews

  validates :name, :hours, :title, :how, :why, :what, :advice, :photo, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
