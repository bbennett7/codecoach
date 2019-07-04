class Connection < ApplicationRecord
  belongs_to :coach, :foreign_key => :id, :class_name => "User"
  belongs_to :student, :foreign_key => :id, :class_name => "User"
end
