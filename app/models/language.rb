class Language < ApplicationRecord
  has_many :languages_mentors
  has_many :mentors, through: :languages_mentors
  has_many :languages_students
  has_many :students, through: :languages_students
  has_many :resources
  has_many :subfields

  validates :name, presence: { message: 'Name cannot be blank.' }
end
