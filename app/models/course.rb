class Course < ApplicationRecord
  belongs_to :school
  has_many :teachings

  validates :faculty, presence: true
  validates :number, presence: true
  validates :school, presence: true

  def self.search(query)
    split = query.split(' ')
    name_results = Course.where("name LIKE ?", "%#{query}%")
    if split.length == 2
      course_results = Course.where("faculty LIKE ? AND number LIKE ?", "%#{split[0]}%", "%#{split[1]}%")
    elsif split.length == 1
      course_results = Course.where("faculty LIKE ? OR number LIKE ?", "%#{split[0]}%", "%#{split[0]}%")
    else
      course_results = []
    end
    course_results + name_results
  end
end
