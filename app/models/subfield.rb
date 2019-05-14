class Subfield < ApplicationRecord
  belongs_to :language
  has_many :resources

  validates :name, presence: { message: 'Name cannot be blank.' }
end
