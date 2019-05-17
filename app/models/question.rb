class Question < ApplicationRecord

  belongs_to :test
  has_many :answers

  scope :all_by_test_id, -> (test_id) {where(test_id: test_id )}

  validates :body, presence: true

end
