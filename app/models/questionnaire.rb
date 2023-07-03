class Questionnaire < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true

  def self.all_questions
    [
      # "I am energized when I help others succeed",
      # "I believe in lifelong learning",
      # "I believe time is too precious to be wasted by being disorganized",
      "Q1: I am excited to explore the world on my own",
      "Q2: I am energized when I speak in front of an audience",
      "Q3: I believe the gold medal is the only medal to aim for",
      "Q4: I naturally see patterns where others see complexity",
      "Q5: I love restoring things and bringing them back to life",
      "Q6: It is natural for me to figure out what's wrong and find solutions",
      "Q7: I enjoy setting goals and defining priorities to achieve them",
      "Q8: I believe the best way of learning is by doing",
      "Q9: I am good at thinking several steps ahead",
      "Q10: I believe that work not only can but also should be fun",
      "Q11: I motivate myself to do things",
      # "It is natural for me to be genuinely interested in other people's growth",
      # "I am energized by mental activity",
      "Q12: I get excited when analyzing and dealing with numbers",
      "Q13: It is natural for me to quickly adjust to changing circumstances",
      "Q14: It is natural for me to voice my opinion, even if it's contrary to others",
      "Q15: I learn new things faster than others",
      # "I believe the best way to achieve success is by focusing on one thing",
      "Q16: I believe success is not limited to money or prestige",
      "Q17: I am driven by the feeling of greater purpose",
      "Q18: I am energized by learning something new",
      "Q19: I am good at making others feel heard, understood, and included",
      "Q20: I would like to constantly be subject to change in my workplace"
      # "I am good at instilling certainty and confidence in other people",
      # "I am good at explaining, describing, and entertaining"
    ]
  end
end
