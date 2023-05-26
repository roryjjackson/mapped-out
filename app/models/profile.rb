class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews
  has_one :questionnaire

  validates :name, :hours, :title, :how, :why, :what, :advice, :photo, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :user_id, uniqueness: true
  # pg_search_scope :search_by_data,
  #   against:
  #   %i[
  #     title
  #     name
  #     how
  #     why
  #     what
  #     address
  #     hours
  #     advice
  #   ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  # pg_search_scope :global_search,
  # against:
  #   %i[
  #     title
  #     name
  #     how
  #     why
  #     what
  #     address
  #     hours
  #     advice
  #   ],
  # associated_against: {
  #   user: [:nickname]
  # },
  # using: {
  #   tsearch: { prefix: true }
  # }

end
