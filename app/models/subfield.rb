class Subfield < ApplicationRecord
  belongs_to :language
  has_many :resources 
end
