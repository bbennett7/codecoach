require 'valid_email'

class Mentor < ApplicationRecord
  has_many :languages_mentors
  has_many :languages, through: :languages_mentors
  has_many :resources
  has_many :subfields, through: :resources
  belongs_to :student, required: false


  has_secure_password

  validates :username, presence: { message: 'cannot be blank.' }
  validates :username, uniqueness: { message: 'is already taken.' }
  validates :username, length: { minimum: 8, message: 'must be at least 8 characters.' }
  validates :first_name, presence: { message: 'cannot be blank.' }
  validates :email, presence: { message: 'cannot be blank.' }
  validates :email, uniqueness: { message: 'is associated with an existing account.' }
  validates :email, email: { message: 'is not a valid email address.' }
  validates :github_link, presence: { message: 'cannot be blank.' }
  validates :github_link, uniqueness: { message: 'is associated with an existing account.' }
  validates :password, presence: { message: 'cannot be blank.' }, :if => :password
  validates :password, length: {minimum: 8, message: 'must be at least 8 characters.' }, :if => :password
end
