require 'digest/sha1'

class User < ApplicationRecord

  CORRECT_EMAIL = /\A[a-z0-9]+[@]{1}[a-z0-9]+\z/.freeze

  has_many :tests, foreign_key: :author_id
  has_many :test_passeges
  has_many :tests, through: :test_passeges

  validates :email, presence: true,
                    uniqueness: {message: "уже используется другим пользователем"}

  validates :email, format: { with: CORRECT_EMAIL,
                                    message: "Неверный формат" }

  has_secure_password

  def find_tests_by_level(level)
    Test.joins(:passed_tests).where(passed_tests: {user_id: self.id}, level: level).pluck(:title)
  end

end
