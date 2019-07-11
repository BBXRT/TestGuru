class Test < ApplicationRecord

  belongs_to :category
  has_one :author, class_name: "User", primary_key: :author_id
  # has_many :passed_tests
  has_many :questions

  has_many :test_passeges
  has_many :users, through: :test_passeges

  scope :select_simple_tests, -> {where(:level => (0..1))}
  scope :select_middle_tests, -> {where(:level => (2..4))}
  scope :select_hard_tests, -> {where(:level => (5..Float::INFINITY))}

  validates :title, presence: true,
                    uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  def self.find_testnames_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end

end
