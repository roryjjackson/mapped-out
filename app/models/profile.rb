class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :questionnaire, dependent: :destroy

  validates :user_id, uniqueness: true
  validates :name, :hours, :title, :how, :why, :what, :advice, :photo, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :what, :why, :how, :advice, length: { minimum: 300 }

  include PgSearch::Model
  pg_search_scope :search_by_query, against: %i[title name how why what address advice hours]

end
