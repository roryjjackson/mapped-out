class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :user2, class_name: 'User'

  has_many :messages, dependent: :destroy

  before_destroy :delete_for_both_users

  private

  def delete_for_both_users
    messages.destroy_all
    user.chatrooms.destroy(self)
    user2.user2_chatrooms.chatrooms.destroy(self)
  end
end
