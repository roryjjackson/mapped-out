class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :user_id, uniqueness: true
  validates :name, :hours, :title, :summary, :personal_background, :compensation,
            :time_off, :entry_qualifications,
            :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :photo, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_query, against: %i[title name how why what address advice hours]

end
