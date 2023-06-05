class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_one :questionnaire, through: :profile, dependent: :destroy
  # has_many :chatrooms, dependent: :destroy
  has_many :reviews, through: :profile, dependent: :destroy
  # has_many :messages, through: :chatrooms, dependent: :destroy

  has_many :chatrooms, dependent: :destroy, foreign_key: 'user_id'
  has_many :user2_chatrooms, class_name: 'Chatroom', dependent: :destroy, foreign_key: 'user2_id'
end
