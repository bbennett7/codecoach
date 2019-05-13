class LanguagesStudent < ApplicationRecord
  belongs_to :language
  belongs_to :student 
end
