class Subfield < ApplicationRecord
  belongs_to :language
  has_many :resources
  has_many :users, through: :resources

  validates :name, presence: { message: 'cannot be blank.' }
end
