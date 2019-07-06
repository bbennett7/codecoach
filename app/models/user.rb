require 'valid_email'

class User < ApplicationRecord
  has_many :languages_users
  has_many :languages, through: :languages_users
  has_many :resources
  has_many :subfields, through: :resources

  has_one :student, class_name: "User", foreign_key: "coach_id"
  belongs_to :coach, class_name: "User", required: false

  has_secure_password

  validates :username, presence: { message: 'cannot be blank.' }
  validates :username, uniqueness: { message: 'is already taken.' }
  validates :username, length: { minimum: 8, message: 'must be at least 8 characters.' }
  validates :user_type, presence: { message: 'cannot be blank.' }
  validates :first_name, presence: { message: 'cannot be blank.' }
  validates :email, presence: { message: 'cannot be blank.' }
  validates :email, uniqueness: { message: 'is associated with an existing account.' }
  validates :email, email: { message: 'is not a valid email address.' }
  validates :github_link, presence: { message: 'cannot be blank.' }, :if => :coach?
  validates :github_link, uniqueness: { message: 'is associated with an existing account.' }, :if => :present?
  validates :password, presence: { message: 'cannot be blank.' }, :if => :password
  validates :password, length: {minimum: 8, message: 'must be at least 8 characters.' }, :if => :password

  # def has_student?
  #   self.student != nil
  # end

  private

  def coach?
    user_type == "coach"
  end

  def present?
    !github_link == ""
  end
end
