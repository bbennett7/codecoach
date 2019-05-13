class Student < ApplicationRecord
  has_many :languages_students
  has_many :languages, through: :languages_students
  has_one :mentor
  has_many :resources, through: :mentor

  has_secure_password
  
end
