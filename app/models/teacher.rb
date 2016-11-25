class Teacher < ApplicationRecord
  has_many :teachings
  belongs_to :school

  validates :name, presence: true
  validates :school, presence: true
end
