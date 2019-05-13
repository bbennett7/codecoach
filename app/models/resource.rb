class Resource < ApplicationRecord
  belongs_to :mentor 
  belongs_to :language
  belongs_to :subfield
end
