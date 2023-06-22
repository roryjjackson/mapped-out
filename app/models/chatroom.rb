class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id'

  has_many :messages, dependent: :destroy

  before_destroy :delete_associated_model

  private

  def delete_associated_model
    self.destroy
  end
end
