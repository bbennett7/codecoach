class Connection < ApplicationRecord
  belongs_to :coach_user_id
  belongs_to :student_user_id 
end
