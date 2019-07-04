class LanguagesMentorSerializer < ActiveModel::Serializer
  attributes :id, :language_id, :mentor_id
  belongs_to :mentor
  belongs_to :language
end
