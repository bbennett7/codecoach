class Mentor < ApplicationRecord
  has_many :languages_mentors
  has_many :languages, through: :languages_mentors
  has_many :resources
  belongs_to :student
end
