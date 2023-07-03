class Questionnaire < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true

  def self.all_questions
    [
      "I am energized when I help others succeed",
      "I believe in lifelong learning",
      "I believe time is too precious to be wasted by being disorganized",
      "I naturally see patterns where others see complexity",
      "I love restoring things and bringing them back to life",
      "I am energized when I speak in front of an audience",
      "It is natural for me to figure out what's wrong and find solutions",
      "I enjoy setting goals and defining priorities to achieve them",
      "I believe the gold medal is the only medal to aim for",
      "I believe the best way of learning is by doing",
      "I am good at thinking several steps ahead",
      "I believe that work not only can but also should be fun",
      "It is natural for me to be genuinely interested in other people's growth",
      "I am energized by mental activity",
      "I get excited when analyzing and dealing with numbers",
      "It is natural for me to quickly adjust to changing circumstances",
      "It is natural for me to voice my opinion, even if it's contrary to others",
      "I learn new things faster than others",
      "I believe the best way to achieve success is by focusing on one thing",
      "I believe success is not limited to money or prestige",
      "I am driven by the feeling of greater purpose",
      "I am energized by learning something new",
      "I am good at making others feel heard, understood, and included",
      "I am good at instilling certainty and confidence in other people",
      "I am good at explaining, describing, and entertaining"
    ]
  end
end
