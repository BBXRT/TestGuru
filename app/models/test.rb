class Test < ApplicationRecord

  belongs_to :category
  has_one :author, class_name: "User", primary_key: :author_id
  has_many :passed_tests
  has_many :questions

  validates :title, presence: true,
                    uniqueness: true

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :select_simple_tests, -> {where(:level => (0..1))}
  scope :select_middle_tests, -> {where(:level => (2..4))}
  scope :select_hard_tests, -> {where(:level => (5..Float::INFINITY))}
  scope :find_testnames_by_category, -> (category) {Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)}

end
