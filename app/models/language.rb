class Language < ApplicationRecord
  has_many :languages_users
  has_many :users, through: :languages_users
  has_many :resources
  has_many :subfields

  validates :name, presence: { message: 'cannot be blank.' }
end
