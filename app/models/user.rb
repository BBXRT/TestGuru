require 'digest/sha1'

class User < ApplicationRecord

  # include Auth

  has_many :tests, foreign_key: :author_id

  has_many :test_passeges
  has_many :tests, through: :test_passeges

  has_secure_password

  def find_tests_by_level(level)
    Test.joins(:passed_tests).where(passed_tests: {user_id: self.id}, level: level).pluck(:title)
  end


end
