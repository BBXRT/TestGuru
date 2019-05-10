class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answer_count

  scope :select_right_answers, -> {where(correct: true)}

  def validate_answer_count
    errors.add(:body) if Answer.where(question_id: self.question_id).pluck(:body).size > 3
  end
end
