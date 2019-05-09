class User < ApplicationRecord

  has_many :tests, through: :passed_tests
  has_many :tests, foreign_key: :author_id

  def find_tests_by_level(level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: self.id }, level: level).pluck(:title)
  end

end
