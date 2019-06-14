class Answer < ApplicationRecord

  belongs_to :question

  scope :correct, -> {where(correct: true)}

  validates :body, presence: true
  validate :validate_answer_count

  def validate_answer_count
    # errors.add(:body) if question.answers.count > 3
    1
  end

end
