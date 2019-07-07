class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def current_question_number
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def questions_count
    test.questions.count
  end

  def check_result?
    correct_answers_count >= 85
  end

  def correct_answers_count
    (correct_questions * 100 / questions_count).round(2)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.question.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) && correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
