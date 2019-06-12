class LanguagesStudentSerializer < ActiveModel::Serializer
  attributes :id, :language_id, :student_id 
  belongs_to :student
  belongs_to :language
end
