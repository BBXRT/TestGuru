class User < ApplicationRecord

  has_many :test

  def find_tests_by_level(level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: self.id }, level: level).pluck(:title)
  end

end
