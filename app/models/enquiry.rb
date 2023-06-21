class Enquiry < ApplicationRecord
  validates :email, :first_name, :last_name, :message, presence: true
end
