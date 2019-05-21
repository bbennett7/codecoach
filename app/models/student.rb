require 'valid_email'

class Student < ApplicationRecord
  has_many :languages_students
  has_many :languages, through: :languages_students
  has_one :mentor
  has_many :resources, through: :mentor
  #delegate :resources, to: :mentor

  has_secure_password

  validates :username, presence: { message: 'cannot be blank.' }
  validates :username, uniqueness: { message: 'is already taken.' }
  validates :username, length: { minimum: 8, message: 'must be at least 8 characters.' }
  validates :first_name, presence: { message: 'cannot be blank.' }
  validates :email, presence: { message: 'cannot be blank.' }
  validates :email, uniqueness: { message: 'is associated with an existing account.' }
  validates :email, email: { message: 'is not a valid email address.' }
#  validates :github_link, presence: { message: 'Github link cannot be blank.' }
  validates :github_link, uniqueness: { message: 'is associated with an existing account.' }, :allow_blank => true 
  validates :password, presence: { message: 'cannot be blank.' }, :if => :password
  validates :password, length: {minimum: 8, message: 'must be at least 8 characters.' }, :if => :password

  def has_mentor?
    self.mentor != nil
  end
end
