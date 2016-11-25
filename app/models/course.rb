class Course < ApplicationRecord
  belongs_to :school
  has_many :teachings

  validates :faculty, presence: true
  validates :number, presence: true
  validates :school, presence: true
end
