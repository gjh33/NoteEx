class School < ApplicationRecord
  has_many :courses
  has_many :teachers
  has_many :terms

  validates :name, presence: true
end
