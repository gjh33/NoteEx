class Teaching < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  belongs_to :term

  has_many :notes

  validates :course, presence: true
  validates :teacher, presence: true
  validates :term, presence: true
end
