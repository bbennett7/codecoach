class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :website, :title, :url, :language_id, :subfield_id, :mentor_id, :read, :student_rating
end
