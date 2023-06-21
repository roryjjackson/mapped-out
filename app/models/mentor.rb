class Mentor < ApplicationRecord
  validates :first_name, :last_name, :email, :number, :occupation, presence: true

end
