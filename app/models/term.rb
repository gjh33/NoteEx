class Term < ApplicationRecord
  belongs_to :school

  validates :year, presence: true
  validates :season, presence: true
  validates :school, presence: true
end
